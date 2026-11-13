import 'package:flutter/material.dart';

import '../core/salary_calculator.dart';
import '../core/tax_year.dart';
import '../l10n/app_localizations.dart';
import 'components.dart';
import 'forms.dart';
import 'theme.dart';

class SalaryTab extends StatelessWidget {
  const SalaryTab({super.key, required this.form});

  final SalaryForm form;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return ListenableBuilder(
      listenable: form,
      builder: (context, _) {
        final gross = parseAmount(form.gross);
        final result = gross != null && gross > 0
            ? SalaryCalculator.calculate(SalaryInput(
                gross,
                payments: form.payments,
                contract: form.contract,
                children: form.children,
                childrenUnder3: form.childrenUnder3,
              ))
            : null;
        return FormColumn(children: [
          AmountField(value: form.gross, onChanged: (v) => form.update((f) => f.gross = v), label: l.grossAnnual),
          PaymentsChoice(payments: form.payments, onChanged: (v) => form.update((f) => f.payments = v)),
          Choice(
            options: [(ContractType.permanent, l.contractPermanent), (ContractType.temporary, l.contractTemporary)],
            selected: form.contract,
            onSelect: (v) => form.update((f) => f.contract = v),
          ),
          CountStepper(label: l.children, value: form.children, onChanged: (v) => form.update((f) => f.children = v)),
          if (form.children > 0)
            CountStepper(
              label: l.childrenUnder3,
              value: form.childrenUnder3,
              max: form.children,
              onChanged: (v) => form.update((f) => f.childrenUnder3 = v),
            ),
          if (result != null) _SalaryResultCard(result),
          Note(l.salaryNote(TaxYears.current.year)),
        ]);
      },
    );
  }
}

class PaymentsChoice extends StatelessWidget {
  const PaymentsChoice({super.key, required this.payments, required this.onChanged});

  final int payments;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Choice(options: [(14, l.payments14), (12, l.payments12)], selected: payments, onSelect: onChanged);
  }
}

class _SalaryResultCard extends StatelessWidget {
  const _SalaryResultCard(this.result);

  final SalaryResult result;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final locale = l.localeName;
    final theme = Theme.of(context);
    final extra = result.netExtraPay;
    return ResultCard(children: [
      Text(l.netMonthly, style: theme.textTheme.titleSmall),
      Text(formatEuros(result.netMonthly, locale),
          style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
      if (extra != null) Text(l.netExtraPay(formatEuros(extra, locale))),
      StackedBar(parts: [
        (result.netAnnual, BreakdownColors.net),
        (result.socialSecurity, BreakdownColors.socialSecurity),
        (result.withholding, BreakdownColors.withholding),
      ]),
      ResultRow(label: l.netAnnual, value: formatEuros(result.netAnnual, locale), color: BreakdownColors.net, bold: true),
      ResultRow(
        label: l.socialSecurity,
        value: formatEuros(result.socialSecurity, locale),
        color: BreakdownColors.socialSecurity,
      ),
      ResultRow(
        label: l.withholding(formatPercent(result.withholdingRate, locale)),
        value: formatEuros(result.withholding, locale),
        color: BreakdownColors.withholding,
      ),
    ]);
  }
}
