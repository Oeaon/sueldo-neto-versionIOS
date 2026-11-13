import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/severance.dart';
import '../l10n/app_localizations.dart';
import 'components.dart';
import 'forms.dart';

class SeveranceTab extends StatelessWidget {
  const SeveranceTab({super.key, required this.form});

  final SeveranceForm form;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final locale = l.localeName;
    return ListenableBuilder(
      listenable: form,
      builder: (context, _) {
        final gross = parseAmount(form.gross);
        final start = form.start;
        final result = gross != null && gross > 0 && start != null && !form.end.isBefore(start)
            ? SeveranceCalculator.calculate(gross, start, form.end, form.type, int.tryParse(form.vacationDays) ?? 0)
            : null;
        return FormColumn(children: [
          AmountField(value: form.gross, onChanged: (v) => form.update((f) => f.gross = v), label: l.grossAnnual),
          _DateField(label: l.startDate, date: form.start, onDate: (d) => form.update((f) => f.start = d)),
          _DateField(label: l.endDate, date: form.end, onDate: (d) => form.update((f) => f.end = d)),
          RadioGroup<DismissalType>(
            groupValue: form.type,
            onChanged: (v) => form.update((f) => f.type = v ?? f.type),
            child: Column(children: [
              for (final type in DismissalType.values)
                RadioListTile<DismissalType>(value: type, title: Text(_dismissalName(l, type)), contentPadding: EdgeInsets.zero),
            ]),
          ),
          AmountField(
            value: form.vacationDays,
            onChanged: (v) => form.update((f) => f.vacationDays = v),
            label: l.vacationDays,
            suffix: l.daysSuffix,
            decimals: false,
          ),
          if (result != null)
            ResultCard(children: [
              ResultRow(label: l.yearsWorked, value: NumberFormat('0.00', locale).format(result.yearsWorked)),
              ResultRow(label: l.compensation, value: formatEuros(result.compensation, locale)),
              ResultRow(label: l.vacationPay, value: formatEuros(result.vacationPay, locale)),
              ResultRow(label: l.severanceTotal, value: formatEuros(result.total, locale), bold: true),
            ]),
          Note(l.severanceNote),
        ]);
      },
    );
  }

  static String _dismissalName(L l, DismissalType type) => switch (type) {
        DismissalType.unfair => l.dismissalUnfair,
        DismissalType.objective => l.dismissalObjective,
        DismissalType.endOfTemporary => l.dismissalTemporary,
        DismissalType.none => l.dismissalNone,
      };
}

class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.date, required this.onDate});

  final String label;
  final DateTime? date;
  final ValueChanged<DateTime> onDate;

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context).localeName;
    return OutlinedButton(
      onPressed: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(1960),
          lastDate: DateTime(DateTime.now().year + 5),
        );
        if (picked != null) onDate(picked);
      },
      child: Text(
        date == null ? label : '$label: ${DateFormat.yMMMd(locale).format(date!)}',
        style: TextStyle(fontWeight: date == null ? FontWeight.normal : FontWeight.w600),
      ),
    );
  }
}
