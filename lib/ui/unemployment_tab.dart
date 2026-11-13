import 'package:flutter/material.dart';

import '../core/unemployment.dart';
import '../l10n/app_localizations.dart';
import 'components.dart';
import 'forms.dart';

class UnemploymentTab extends StatelessWidget {
  const UnemploymentTab({super.key, required this.form});

  final UnemploymentForm form;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final locale = l.localeName;
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: form,
      builder: (context, _) {
        final base = parseAmount(form.monthlyBase);
        final days = int.tryParse(form.daysContributed);
        final result = base != null && base > 0 && days != null
            ? UnemploymentCalculator.calculate(base, days, form.children)
            : null;
        return FormColumn(children: [
          AmountField(
            value: form.monthlyBase,
            onChanged: (v) => form.update((f) => f.monthlyBase = v),
            label: l.unemploymentBase,
          ),
          Note(l.unemploymentBaseHelp),
          AmountField(
            value: form.daysContributed,
            onChanged: (v) => form.update((f) => f.daysContributed = v),
            label: l.unemploymentDays,
            suffix: l.daysSuffix,
            decimals: false,
          ),
          CountStepper(label: l.children, value: form.children, onChanged: (v) => form.update((f) => f.children = v)),
          if (result != null)
            ResultCard(children: [
              if (!result.hasRight)
                Text(l.unemploymentNoRight, style: theme.textTheme.bodyLarge)
              else ...[
                Text(
                  l.unemploymentDuration(result.days, result.days ~/ 30),
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                ResultRow(label: l.unemploymentFirst180, value: formatEuros(result.first180, locale), bold: true),
                if (result.days > 180) ResultRow(label: l.unemploymentFrom181, value: formatEuros(result.from181, locale)),
                if (result.days > 360) ResultRow(label: l.unemploymentFrom361, value: formatEuros(result.from361, locale)),
              ],
            ]),
          Note(l.unemploymentNote),
        ]);
      },
    );
  }
}
