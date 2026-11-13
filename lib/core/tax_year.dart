/// Valores fiscales y de cotización de un año. Todos los importes en euros.
/// Al cambiar de año basta con añadir otra instancia y revisar cada valor con el BOE.
class TaxYear {
  const TaxYear({
    required this.year,
    required this.commonRate,
    required this.trainingRate,
    required this.meiRate,
    required this.unemploymentRatePermanent,
    required this.unemploymentRateTemporary,
    required this.maxMonthlyBase,
    required this.solidarityRates,
    required this.solidarityWorkerShare,
    required this.withholdingScale,
    required this.otherDeductibleExpenses,
    required this.personalMinimum,
    required this.childMinimums,
    required this.childUnder3Extra,
    required this.noWithholdingLimits,
    required this.withholdingCapRate,
    required this.monthlyIprem,
  });

  final int year;

  /// Cuota del trabajador: contingencias comunes, formación profesional y MEI (en tanto por uno).
  final double commonRate;
  final double trainingRate;
  final double meiRate;
  final double unemploymentRatePermanent;
  final double unemploymentRateTemporary;

  /// Base máxima de cotización mensual.
  final double maxMonthlyBase;

  /// Cuota de solidaridad (total empresa + trabajador) por tramos del exceso sobre la base máxima.
  final List<double> solidarityRates;

  /// Parte de la cuota de solidaridad que paga el trabajador (la misma proporción que en contingencias comunes).
  final double solidarityWorkerShare;

  /// Escala de retenciones (art. 85 del Reglamento del IRPF): límites superiores y tipos.
  final List<Bracket> withholdingScale;
  final double otherDeductibleExpenses;
  final double personalMinimum;
  final List<double> childMinimums;
  final double childUnder3Extra;

  /// Sueldos hasta este importe no tienen retención (contribuyente sin cónyuge a cargo), por número de hijos 0, 1, 2+.
  final List<double> noWithholdingLimits;

  /// Tope de la retención: este porcentaje del exceso sobre el límite sin retención.
  final double withholdingCapRate;

  /// IPREM mensual, para los límites del paro.
  final double monthlyIprem;

  double get socialSecurityRatePermanent => commonRate + trainingRate + meiRate + unemploymentRatePermanent;

  double get socialSecurityRateTemporary => commonRate + trainingRate + meiRate + unemploymentRateTemporary;
}

class Bracket {
  const Bracket(this.upTo, this.rate);

  final double upTo;
  final double rate;
}

class TaxYears {
  TaxYears._();

  /// 2026. Revisar con el BOE antes de publicar: base máxima, tipos de la cuota de solidaridad,
  /// MEI, límites sin retención e IPREM (los de 2025 si no se han actualizado).
  static const TaxYear y2026 = TaxYear(
    year: 2026,
    commonRate: 0.0470,
    trainingRate: 0.0010,
    meiRate: 0.0015,
    unemploymentRatePermanent: 0.0155,
    unemploymentRateTemporary: 0.0160,
    maxMonthlyBase: 5101.20,
    solidarityRates: [0.0115, 0.0125, 0.0146],
    solidarityWorkerShare: 4.70 / 28.30,
    withholdingScale: [
      Bracket(12450, 0.19),
      Bracket(20200, 0.24),
      Bracket(35200, 0.30),
      Bracket(60000, 0.37),
      Bracket(300000, 0.45),
      Bracket(double.maxFinite, 0.47),
    ],
    otherDeductibleExpenses: 2000,
    personalMinimum: 5550,
    childMinimums: [2400, 2700, 4000, 4500],
    childUnder3Extra: 2800,
    noWithholdingLimits: [15876, 16342, 16867],
    withholdingCapRate: 0.43,
    monthlyIprem: 600,
  );

  static const TaxYear current = y2026;
}
