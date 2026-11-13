// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get tabSalary => 'Payslip';

  @override
  String get tabCompare => 'Compare offers';

  @override
  String get tabUnemployment => 'Unemployment';

  @override
  String get tabSeverance => 'Dismissal';

  @override
  String get grossAnnual => 'Gross annual salary';

  @override
  String get payments14 => '14 payments';

  @override
  String get payments12 => '12 payments';

  @override
  String get contractPermanent => 'Permanent';

  @override
  String get contractTemporary => 'Temporary';

  @override
  String get children => 'Dependent children';

  @override
  String get childrenUnder3 => 'Of them, under 3 years old';

  @override
  String get netMonthly => 'Net per month';

  @override
  String netExtraPay(String p1) {
    return 'Each extra payment: $p1';
  }

  @override
  String get netAnnual => 'Net per year';

  @override
  String get socialSecurity => 'Social Security';

  @override
  String withholding(String p1) {
    return 'Income tax ($p1)';
  }

  @override
  String salaryNote(int p1) {
    return 'Estimate using $p1 withholding rules for a taxpayer with no dependent spouse, no disability and children shared with the other parent. Not valid for the Basque Country or Navarre. Your payslip may differ depending on your collective agreement and personal situation.';
  }

  @override
  String get compareTitle => 'Compare two offers';

  @override
  String get compareLocked =>
      'Enter two gross salaries and see which one leaves you more money each month and how much of the raise reaches your pocket.';

  @override
  String get offerA => 'Offer A (gross per year)';

  @override
  String get offerB => 'Offer B (gross per year)';

  @override
  String get offerANet => 'Offer A, net per month';

  @override
  String get offerBNet => 'Offer B, net per month';

  @override
  String compareDifference(String p1, String p2, String p3) {
    return '$p1 leaves you $p2 more per month ($p3 per year)';
  }

  @override
  String compareKept(int p1) {
    return 'For every €100 of gross difference you keep €$p1.';
  }

  @override
  String get unemploymentBase => 'Average monthly contribution base';

  @override
  String get unemploymentBaseHelp =>
      'It is the average of the last 6 months. If you do not know it, use your gross annual salary divided by 12.';

  @override
  String get unemploymentDays => 'Days contributed in the last 6 years';

  @override
  String get daysSuffix => 'days';

  @override
  String get unemploymentNoRight =>
      'With fewer than 360 days contributed there is no contributory benefit. You may be entitled to an allowance.';

  @override
  String unemploymentDuration(int p1, int p2) {
    return 'You would receive $p1 days (about $p2 months)';
  }

  @override
  String get unemploymentFirst180 => 'First 6 months (70 %)';

  @override
  String get unemploymentFrom181 => 'Months 7 to 12 (60 %)';

  @override
  String get unemploymentFrom361 => 'From month 13 (50 %)';

  @override
  String get unemploymentNote =>
      'Gross monthly amounts with the 2026 limits. Social Security contributions and, if applicable, income tax are deducted when paid.';

  @override
  String get startDate => 'Start date';

  @override
  String get endDate => 'End date';

  @override
  String get dismissalUnfair => 'Unfair dismissal (33 days per year)';

  @override
  String get dismissalObjective => 'Objective dismissal (20 days per year)';

  @override
  String get dismissalTemporary =>
      'End of temporary contract (12 days per year)';

  @override
  String get dismissalNone => 'Voluntary resignation (no compensation)';

  @override
  String get vacationDays => 'Unused holiday days';

  @override
  String get yearsWorked => 'Years worked';

  @override
  String get compensation => 'Compensation';

  @override
  String get vacationPay => 'Pending holidays';

  @override
  String get severanceTotal => 'Approximate total';

  @override
  String get severanceNote =>
      'Gross estimate for contracts signed since 12 February 2012. The actual settlement also includes the days worked in the month and the accrued part of the extra payments.';

  @override
  String get premiumFeatureCompare => 'Job offer comparison';

  @override
  String get premiumSettingsText =>
      'Remove the ads and unlock the offer comparison.';

  @override
  String get removeAds => 'Remove ads';

  @override
  String get privacyOptions => 'Ad privacy options';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutText =>
      'Indicative payslip, unemployment and compensation calculators under Spanish rules. They do not replace professional advice.';

  @override
  String get sourceTitle => 'Official sources';

  @override
  String get source1 => 'Income tax (IRPF) – Spanish Tax Agency';

  @override
  String get source2 => 'Contributions – Social Security';

  @override
  String get source3 => 'Unemployment benefit – SEPE';

  @override
  String get source4 => 'Workers\' Statute (BOE)';

  @override
  String get aboutDisclaimer =>
      'Sueldo Neto is an independent app and is not affiliated with the Spanish Tax Agency, Social Security, SEPE or any government body.';

  @override
  String version(String p1) {
    return 'Version $p1';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get premiumBack => 'Back';

  @override
  String get premiumHeadline => 'Go Premium';

  @override
  String get premiumActive => 'You are Premium. Thanks for your support!';

  @override
  String get premiumBenefitNoAds => 'No ads';

  @override
  String premiumMonthly(String p1) {
    return '$p1 per month';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1, one-off payment forever';
  }

  @override
  String get premiumLoading => 'Loading price…';

  @override
  String get premiumStoreUnavailable =>
      'Cannot connect to the App Store. Try again later.';

  @override
  String get premiumRestore => 'Restore purchases';

  @override
  String get premiumLegal =>
      'The subscription renews every month and you can cancel it at any time in the App Store.';

  @override
  String get lockedWatchAd => 'Watch an ad to unlock for 24 h';

  @override
  String get lockedGoPremium => 'Go Premium';

  @override
  String get rewardedUnavailable =>
      'No ad is available right now. Try again in a while.';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfUse => 'Terms of use';
}
