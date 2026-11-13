import 'salary_calculator.dart';

/// Diferencia entre dos ofertas (B menos A).
class SalaryComparison {
  const SalaryComparison(this.a, this.b);

  final SalaryResult a;
  final SalaryResult b;

  double get netAnnualDifference => b.netAnnual - a.netAnnual;

  double get netMonthlyDifference => netAnnualDifference / 12;

  /// Cuánto de cada euro bruto de más llega al bolsillo (tipo marginal efectivo inverso).
  double? get keptPerExtraEuro {
    final grossDiff = b.grossAnnual - a.grossAnnual;
    return grossDiff == 0 ? null : netAnnualDifference / grossDiff;
  }
}
