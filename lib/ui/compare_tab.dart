import 'package:flutter/material.dart';

import '../core/salary_calculator.dart';
import '../core/salary_comparison.dart';
import '../l10n/app_localizations.dart';
import '../monetization/monetization.dart';
import '../monetization/monetization_ui.dart';
import 'components.dart';
import 'forms.dart';
import 'salary_tab.dart';
import 'theme.dart';

/// Función Premium: comparar dos ofertas en neto.
class CompareTab extends StatelessWidget {
  const CompareTab({super.key, required this.form, required this.monetization, required this.onGoPremium});

  final CompareForm form;
  final Monetization monetization;
  final VoidCallback onGoPremium;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return FormColumn(children: [
      LockedFeature(
        monetization: monetization,
        title: l.compareTitle,
        description: l.compareLocked,
        onGoPremium: onGoPremium,
        child: _CompareContent(form),
      ),
    ]);
  }
}

class _CompareContent extends StatelessWidget {
  const _CompareContent(this.form);

  final CompareForm form;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final locale = l.localeName;
    return ListenableBuilder(
      listenable: form,
      builder: (context, _) {
        final a = parseAmount(form.grossA);
        final b = parseAmount(form.grossB);
        SalaryComparison? comparison;
        if (a != null && a > 0 && b != null && b > 0) {
          comparison = SalaryComparison(
            SalaryCalculator.calculate(SalaryInput(a, payments: form.payments, children: form.children)),
            SalaryCalculator.calculate(SalaryInput(b, payments: form.payments, children: form.children)),
          );
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 12, children: [
          Text(l.compareTitle, style: Theme.of(context).textTheme.titleMedium),
          AmountField(value: form.grossA, onChanged: (v) => form.update((f) => f.grossA = v), label: l.offerA),
          AmountField(value: form.grossB, onChanged: (v) => form.update((f) => f.grossB = v), label: l.offerB),
          PaymentsChoice(payments: form.payments, onChanged: (v) => form.update((f) => f.payments = v)),
          CountStepper(label: l.children, value: form.children, onChanged: (v) => form.update((f) => f.children = v)),
          if (comparison != null) ...[
            ResultCard(children: [
              ResultRow(label: l.offerANet, value: formatEuros(comparison.a.netMonthly, locale)),
              ResultRow(label: l.offerBNet, value: formatEuros(comparison.b.netMonthly, locale)),
              Text(
                l.compareDifference(
                  comparison.netAnnualDifference >= 0 ? l.offerB : l.offerA,
                  formatEuros(comparison.netAnnualDifference.abs() / 12, locale),
                  formatEuros(comparison.netAnnualDifference.abs(), locale),
                ),
                style: const TextStyle(fontWeight: FontWeight.w600, color: BreakdownColors.net),
              ),
              if (comparison.keptPerExtraEuro != null) Note(l.compareKept((comparison.keptPerExtraEuro! * 100).round())),
            ]),
          ],
        ]);
      },
    );
  }
}
