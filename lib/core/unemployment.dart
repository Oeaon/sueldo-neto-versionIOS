import 'dart:math';

import 'tax_year.dart';

class UnemploymentResult {
  const UnemploymentResult(this.days, this.first180, this.from181, this.from361);

  /// Días de prestación; 0 si no llega al mínimo de 360 días cotizados.
  final int days;

  /// Importe bruto mensual en cada tramo: días 1-180, 181-360 y desde el 361.
  final double first180;
  final double from181;
  final double from361;

  bool get hasRight => days > 0;
}

/// Prestación contributiva por desempleo (paro) tras la reforma de noviembre de 2024.
class UnemploymentCalculator {
  UnemploymentCalculator._();

  static UnemploymentResult calculate(
    double averageMonthlyBase,
    int daysContributedLast6Years,
    int children, [
    TaxYear tax = TaxYears.current,
  ]) {
    final days = durationDays(daysContributedLast6Years);
    if (days == 0) return const UnemploymentResult(0, 0, 0, 0);
    final dailyBase = averageMonthlyBase / 30;
    // Límites sobre el IPREM incrementado en una sexta parte (pagas extras).
    final iprem = tax.monthlyIprem * 7 / 6;
    final maxFactor = children <= 0 ? 1.75 : (children == 1 ? 2.00 : 2.25);
    final minFactor = children <= 0 ? 0.80 : 1.07;
    double monthly(double percent) => min(max(dailyBase * 30 * percent, iprem * minFactor), iprem * maxFactor);
    return UnemploymentResult(days, monthly(0.70), monthly(0.60), monthly(0.50));
  }

  /// Tabla del art. 269 de la Ley General de la Seguridad Social: 120 días por 360 cotizados, +60 cada 180, máximo 720.
  static int durationDays(int daysContributed) {
    if (daysContributed < 360) return 0;
    final steps = (daysContributed - 360) ~/ 180;
    return min(120 + steps * 60, 720);
  }
}
