import 'dart:math';

import 'tax_year.dart';

enum ContractType { permanent, temporary }

class SalaryInput {
  const SalaryInput(
    this.grossAnnual, {
    this.payments = 14,
    this.contract = ContractType.permanent,
    this.children = 0,
    this.childrenUnder3 = 0,
  });

  final double grossAnnual;

  /// 12 o 14 pagas.
  final int payments;
  final ContractType contract;
  final int children;
  final int childrenUnder3;
}

class SalaryResult {
  const SalaryResult({
    required this.grossAnnual,
    required this.socialSecurity,
    required this.withholdingRate,
    required this.withholding,
    required this.payments,
  });

  final double grossAnnual;
  final double socialSecurity;

  /// Tipo de retención en porcentaje con dos decimales, como en la nómina.
  final double withholdingRate;
  final double withholding;
  final int payments;

  double get netAnnual => grossAnnual - socialSecurity - withholding;

  /// Neto de un mes normal. Con 14 pagas la Seguridad Social se reparte en 12 meses (extras prorrateadas).
  double get netMonthly => grossAnnual / payments - socialSecurity / 12 - withholding / payments;

  /// Neto de cada paga extra (solo con 14 pagas): no cotiza aparte, solo retiene IRPF.
  double? get netExtraPay => payments == 14 ? grossAnnual / 14 * (1 - withholdingRate / 100) : null;
}

/// Nómina española por el procedimiento general de retenciones del IRPF (art. 80-86 del Reglamento).
/// Supuestos: contribuyente sin cónyuge a cargo, menor de 65 años, sin discapacidad, hijos
/// compartidos con el otro progenitor (mínimo por descendientes al 50 %). No vale para País Vasco ni Navarra.
class SalaryCalculator {
  SalaryCalculator._();

  static SalaryResult calculate(SalaryInput input, [TaxYear tax = TaxYears.current]) {
    assert(input.payments == 12 || input.payments == 14);
    final gross = max(input.grossAnnual, 0.0);
    final socialSecurityAmount = socialSecurity(gross, input.contract, tax);
    final rate = withholdingRate(gross, socialSecurityAmount, input, tax);
    return SalaryResult(
      grossAnnual: gross,
      socialSecurity: socialSecurityAmount,
      withholdingRate: rate,
      withholding: gross * rate / 100,
      payments: input.payments,
    );
  }

  static double socialSecurity(double gross, ContractType contract, TaxYear tax) {
    final rate = contract == ContractType.permanent ? tax.socialSecurityRatePermanent : tax.socialSecurityRateTemporary;
    final monthly = gross / 12;
    final base = min(monthly, tax.maxMonthlyBase);
    return (base * rate + _solidarity(monthly, tax)) * 12;
  }

  /// Cuota de solidaridad del trabajador sobre lo que pasa de la base máxima.
  static double _solidarity(double monthly, TaxYear tax) {
    final excess = monthly - tax.maxMonthlyBase;
    if (excess <= 0) return 0;
    final limits = [tax.maxMonthlyBase * 0.10, tax.maxMonthlyBase * 0.50, double.maxFinite];
    var previous = 0.0;
    var total = 0.0;
    for (var i = 0; i < limits.length; i++) {
      final inBracket = max(min(excess, limits[i]) - previous, 0.0);
      total += inBracket * tax.solidarityRates[i];
      previous = limits[i];
    }
    return total * tax.solidarityWorkerShare;
  }

  static double withholdingRate(double gross, double socialSecurity, SalaryInput input, TaxYear tax) {
    final limitIndex = input.children.clamp(0, tax.noWithholdingLimits.length - 1);
    final noWithholdingLimit = tax.noWithholdingLimits[limitIndex];
    if (gross <= noWithholdingLimit) return 0;

    final netWork = max(gross - socialSecurity - tax.otherDeductibleExpenses, 0.0);
    final base = max(netWork - workIncomeReduction(netWork), 0.0);
    final minimum = _personalAndFamilyMinimum(input, tax);
    final quota = max(scale(base, tax) - scale(minimum, tax), 0.0);
    final capped = min(quota, (gross - noWithholdingLimit) * tax.withholdingCapRate);
    return (capped / gross * 100 * 100).roundToDouble() / 100;
  }

  /// Reducción por obtención de rendimientos del trabajo (art. 20 de la Ley del IRPF).
  static double workIncomeReduction(double netWork) {
    if (netWork <= 14852) return 7302;
    if (netWork <= 17673.52) return 7302 - 1.75 * (netWork - 14852);
    if (netWork <= 19747.50) return 2364.34 - 1.14 * (netWork - 17673.52);
    return 0;
  }

  static double _personalAndFamilyMinimum(SalaryInput input, TaxYear tax) {
    var children = 0.0;
    for (var i = 0; i < max(input.children, 0); i++) {
      children += tax.childMinimums[min(i, tax.childMinimums.length - 1)];
    }
    final under3 = input.childrenUnder3.clamp(0, max(input.children, 0)) * tax.childUnder3Extra;
    return tax.personalMinimum + (children + under3) / 2;
  }

  static double scale(double amount, TaxYear tax) {
    var previous = 0.0;
    var total = 0.0;
    for (final bracket in tax.withholdingScale) {
      if (amount <= previous) break;
      total += (min(amount, bracket.upTo) - previous) * bracket.rate;
      previous = bracket.upTo;
    }
    return total;
  }
}
