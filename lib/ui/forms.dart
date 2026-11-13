import 'package:flutter/foundation.dart';

import '../core/salary_calculator.dart';
import '../core/severance.dart';

/// Lo escrito en cada calculadora, para no perderlo al cambiar de pestaña.
class Forms {
  final salary = SalaryForm();
  final compare = CompareForm();
  final unemployment = UnemploymentForm();
  final severance = SeveranceForm();
}

class SalaryForm extends ChangeNotifier {
  String gross = '';
  int payments = 14;
  ContractType contract = ContractType.permanent;
  int children = 0;
  int childrenUnder3 = 0;

  void update(void Function(SalaryForm f) change) {
    change(this);
    childrenUnder3 = childrenUnder3.clamp(0, children);
    notifyListeners();
  }
}

class CompareForm extends ChangeNotifier {
  String grossA = '';
  String grossB = '';
  int payments = 14;
  int children = 0;

  void update(void Function(CompareForm f) change) {
    change(this);
    notifyListeners();
  }
}

class UnemploymentForm extends ChangeNotifier {
  String monthlyBase = '';
  String daysContributed = '';
  int children = 0;

  void update(void Function(UnemploymentForm f) change) {
    change(this);
    notifyListeners();
  }
}

class SeveranceForm extends ChangeNotifier {
  String gross = '';
  DateTime? start;
  DateTime end = _today();
  DismissalType type = DismissalType.unfair;
  String vacationDays = '';

  void update(void Function(SeveranceForm f) change) {
    change(this);
    notifyListeners();
  }

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
