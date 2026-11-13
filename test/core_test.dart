import 'package:flutter_test/flutter_test.dart';
import 'package:sueldo_neto/core/salary_calculator.dart';
import 'package:sueldo_neto/core/salary_comparison.dart';
import 'package:sueldo_neto/core/severance.dart';
import 'package:sueldo_neto/core/tax_year.dart';
import 'package:sueldo_neto/core/unemployment.dart';

// Los mismos casos que los tests de la versión Android (core/src/test).
void main() {
  const tax = TaxYears.y2026;

  group('nómina', () {
    test('30000 brutos en 14 pagas sin hijos', () {
      final result = SalaryCalculator.calculate(const SalaryInput(30000, payments: 14));

      // 6,50 % de Seguridad Social: 1950 €.
      expect(result.socialSecurity, closeTo(1950, 0.01));
      // Base 26.050 → cuota 5.980,50 − 1.054,50 del mínimo personal = 4.926 → 16,42 %.
      expect(result.withholdingRate, 16.42);
      expect(result.withholding, closeTo(4926, 0.01));
      expect(result.netAnnual, closeTo(23124, 0.01));
      expect(result.netMonthly, closeTo(30000 / 14 - 1950 / 12 - 4926 / 14, 0.01));
      expect(result.netExtraPay!, closeTo(30000 / 14 * (1 - 0.1642), 0.01));
    });

    test('con 12 pagas el neto mensual es el anual entre 12', () {
      final result = SalaryCalculator.calculate(const SalaryInput(30000, payments: 12));

      expect(result.netMonthly, closeTo(result.netAnnual / 12, 0.01));
      expect(result.netExtraPay, isNull);
    });

    test('por debajo del límite no hay retención', () {
      expect(SalaryCalculator.calculate(const SalaryInput(15500)).withholdingRate, 0);
    });

    test('sueldo bajo con reducción por rendimientos del trabajo', () {
      // 16.000: SS 1.040, rendimiento neto 12.960, reducción 7.302 → base 5.658 → 0,19 × 108 = 20,52 € → 0,13 %.
      expect(SalaryCalculator.calculate(const SalaryInput(16000)).withholdingRate, 0.13);
    });

    test('el contrato temporal cotiza más por desempleo', () {
      final permanent = SalaryCalculator.calculate(const SalaryInput(25000));
      final temporary = SalaryCalculator.calculate(const SalaryInput(25000, contract: ContractType.temporary));

      expect(temporary.socialSecurity - permanent.socialSecurity, closeTo(25000 * 0.0005, 0.01));
    });

    test('los hijos bajan la retención', () {
      final none = SalaryCalculator.calculate(const SalaryInput(30000));
      final two = SalaryCalculator.calculate(const SalaryInput(30000, children: 2, childrenUnder3: 1));

      expect(two.withholdingRate, lessThan(none.withholdingRate));
      // Mínimo: 5.550 + (2.400 + 2.700 + 2.800) / 2 = 9.500.
      final expectedQuota = SalaryCalculator.scale(26050, tax) - SalaryCalculator.scale(9500, tax);
      expect(two.withholdingRate, (expectedQuota / 30000 * 10000).round() / 100);
    });

    test('por encima de la base máxima cotiza la base máxima más la solidaridad', () {
      const gross = 100000.0;
      final result = SalaryCalculator.calculate(const SalaryInput(gross));
      final excess = gross / 12 - tax.maxMonthlyBase;
      // El exceso (3.232 €/mes) pasa del 50 % de la base máxima, así que toca los tres tramos.
      final tramo1 = tax.maxMonthlyBase * 0.10;
      final tramo2 = tax.maxMonthlyBase * 0.50;
      final solidarity =
          (tramo1 * 0.0115 + (tramo2 - tramo1) * 0.0125 + (excess - tramo2) * 0.0146) * tax.solidarityWorkerShare * 12;

      expect(result.socialSecurity, closeTo(tax.maxMonthlyBase * 12 * tax.socialSecurityRatePermanent + solidarity, 0.01));
    });

    test('escala de retenciones por tramos', () {
      expect(SalaryCalculator.scale(12450, tax), closeTo(12450 * 0.19, 1e-9));
      expect(
        SalaryCalculator.scale(100000, tax),
        closeTo(2365.5 + 7750 * 0.24 + 15000 * 0.30 + 24800 * 0.37 + 40000 * 0.45, 1e-6),
      );
    });

    test('reducción por rendimientos del trabajo en sus tramos', () {
      expect(SalaryCalculator.workIncomeReduction(14000), closeTo(7302, 1e-9));
      expect(SalaryCalculator.workIncomeReduction(15852), closeTo(7302 - 1.75 * 1000, 1e-9));
      expect(SalaryCalculator.workIncomeReduction(20000), closeTo(0, 1e-9));
    });

    test('la comparación da la diferencia neta y cuánto queda de cada euro', () {
      final a = SalaryCalculator.calculate(const SalaryInput(30000));
      final b = SalaryCalculator.calculate(const SalaryInput(35000));
      final comparison = SalaryComparison(a, b);

      expect(comparison.netAnnualDifference, closeTo(b.netAnnual - a.netAnnual, 1e-9));
      expect(comparison.keptPerExtraEuro!, inInclusiveRange(0.5, 0.75));
    });
  });

  group('paro y despido', () {
    test('duración del paro según días cotizados', () {
      expect(UnemploymentCalculator.durationDays(359), 0);
      expect(UnemploymentCalculator.durationDays(360), 120);
      expect(UnemploymentCalculator.durationDays(539), 120);
      expect(UnemploymentCalculator.durationDays(540), 180);
      expect(UnemploymentCalculator.durationDays(2160), 720);
      expect(UnemploymentCalculator.durationDays(5000), 720);
    });

    test('importe del paro 70 60 50 con topes', () {
      final result = UnemploymentCalculator.calculate(1500, 1000, 0);

      expect(result.first180, closeTo(1050, 1e-9));
      expect(result.from181, closeTo(900, 1e-9));
      expect(result.from361, closeTo(750, 1e-9));
    });

    test('el paro tiene tope máximo y mínimo', () {
      const iprem = 600.0 * 7 / 6;
      final high = UnemploymentCalculator.calculate(4000, 2000, 0);
      final low = UnemploymentCalculator.calculate(500, 2000, 1);

      expect(high.first180, closeTo(iprem * 1.75, 1e-9));
      expect(low.from361, closeTo(iprem * 1.07, 1e-9));
    });

    test('sin 360 días no hay derecho a paro', () {
      expect(UnemploymentCalculator.calculate(1500, 200, 0).hasRight, isFalse);
    });

    test('despido improcedente 33 días por año', () {
      final result = SeveranceCalculator.calculate(36500, DateTime(2020), DateTime(2025), DismissalType.unfair, 10);

      expect(result.compensation, closeTo(100.0 * 33 * (1827 / 365.0), 1e-6));
      expect(result.vacationPay, closeTo(1000, 1e-9));
    });

    test('la indemnización del despido objetivo tiene tope de 12 mensualidades', () {
      final result = SeveranceCalculator.calculate(36500, DateTime(1990), DateTime(2025), DismissalType.objective, 0);

      expect(result.compensation, closeTo(36500, 1e-9));
    });
  });
}
