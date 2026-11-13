import 'dart:math';

enum DismissalType {
  /// Despido improcedente (contratos desde el 12/02/2012).
  unfair(33, 24),

  /// Despido objetivo.
  objective(20, 12),

  /// Fin de contrato temporal.
  endOfTemporary(12, null),

  /// Baja voluntaria o despido disciplinario procedente: sin indemnización.
  none(0, null);

  const DismissalType(this.daysPerYear, this.maxMonths);

  final int daysPerYear;
  final int? maxMonths;
}

class SeveranceResult {
  const SeveranceResult(this.compensation, this.vacationPay, this.yearsWorked);

  final double compensation;
  final double vacationPay;
  final double yearsWorked;

  double get total => compensation + vacationPay;
}

class SeveranceCalculator {
  SeveranceCalculator._();

  /// Indemnización por años trabajados (con su tope en mensualidades) más vacaciones no disfrutadas.
  /// El salario diario es el bruto anual entre 365. No incluye la parte del mes ni las pagas extras devengadas.
  static SeveranceResult calculate(
    double grossAnnual,
    DateTime start,
    DateTime end,
    DismissalType type,
    int pendingVacationDays,
  ) {
    assert(!end.isBefore(start));
    final daily = grossAnnual / 365;
    // Días naturales entre fechas, sin que influya el cambio de hora.
    final days = DateTime.utc(end.year, end.month, end.day).difference(DateTime.utc(start.year, start.month, start.day)).inDays;
    final years = days / 365.0;
    final uncapped = daily * type.daysPerYear * years;
    final cap = type.maxMonths == null ? double.maxFinite : grossAnnual / 12 * type.maxMonths!;
    return SeveranceResult(min(uncapped, cap), daily * max(pendingVacationDays, 0), years);
  }
}
