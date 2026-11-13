// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class LCa extends L {
  LCa([String locale = 'ca']) : super(locale);

  @override
  String get settings => 'Configuració';

  @override
  String get tabSalary => 'Nòmina';

  @override
  String get tabCompare => 'Comparar ofertes';

  @override
  String get tabUnemployment => 'Atur';

  @override
  String get tabSeverance => 'Acomiadament';

  @override
  String get grossAnnual => 'Sou brut anual';

  @override
  String get payments14 => '14 pagues';

  @override
  String get payments12 => '12 pagues';

  @override
  String get contractPermanent => 'Indefinit';

  @override
  String get contractTemporary => 'Temporal';

  @override
  String get children => 'Fills a càrrec';

  @override
  String get childrenUnder3 => 'D\'aquests, menors de 3 anys';

  @override
  String get netMonthly => 'Net al mes';

  @override
  String netExtraPay(String p1) {
    return 'Cada paga extra: $p1';
  }

  @override
  String get netAnnual => 'Net a l\'any';

  @override
  String get socialSecurity => 'Seguretat Social';

  @override
  String withholding(String p1) {
    return 'IRPF ($p1)';
  }

  @override
  String salaryNote(int p1) {
    return 'Càlcul orientatiu amb les retencions del $p1 per a un contribuent sense cònjuge a càrrec, sense discapacitat i amb els fills compartits amb l\'altre progenitor. No serveix per al País Basc ni Navarra. La teva nòmina pot variar segons el teu conveni i la teva situació personal.';
  }

  @override
  String get compareTitle => 'Compara dues ofertes';

  @override
  String get compareLocked =>
      'Posa dos sous bruts i mira quin et deixa més diners cada mes i quanta part de l\'augment arriba a la teva butxaca.';

  @override
  String get offerA => 'Oferta A (brut anual)';

  @override
  String get offerB => 'Oferta B (brut anual)';

  @override
  String get offerANet => 'Oferta A, net al mes';

  @override
  String get offerBNet => 'Oferta B, net al mes';

  @override
  String compareDifference(String p1, String p2, String p3) {
    return '$p1 et deixa $p2 més al mes ($p3 a l\'any)';
  }

  @override
  String compareKept(int p1) {
    return 'De cada 100 € bruts de diferència et queden $p1 €.';
  }

  @override
  String get unemploymentBase => 'Base de cotització mitjana mensual';

  @override
  String get unemploymentBaseHelp =>
      'És la mitjana dels últims 6 mesos. Si no la saps, fes servir el teu brut anual dividit entre 12.';

  @override
  String get unemploymentDays => 'Dies cotitzats en els últims 6 anys';

  @override
  String get daysSuffix => 'dies';

  @override
  String get unemploymentNoRight =>
      'Amb menys de 360 dies cotitzats no hi ha prestació contributiva. Potser tens dret a un subsidi.';

  @override
  String unemploymentDuration(int p1, int p2) {
    return 'Cobraries $p1 dies (uns $p2 mesos)';
  }

  @override
  String get unemploymentFirst180 => 'Primers 6 mesos (70 %)';

  @override
  String get unemploymentFrom181 => 'Del mes 7 al 12 (60 %)';

  @override
  String get unemploymentFrom361 => 'A partir del mes 13 (50 %)';

  @override
  String get unemploymentNote =>
      'Imports bruts al mes, amb els límits del 2026. En cobrar es descompta la cotització a la Seguretat Social i, si escau, l\'IRPF.';

  @override
  String get startDate => 'Data d\'alta';

  @override
  String get endDate => 'Data de baixa';

  @override
  String get dismissalUnfair => 'Acomiadament improcedent (33 dies per any)';

  @override
  String get dismissalObjective => 'Acomiadament objectiu (20 dies per any)';

  @override
  String get dismissalTemporary => 'Fi de contracte temporal (12 dies per any)';

  @override
  String get dismissalNone => 'Baixa voluntària (sense indemnització)';

  @override
  String get vacationDays => 'Dies de vacances no gaudits';

  @override
  String get yearsWorked => 'Anys treballats';

  @override
  String get compensation => 'Indemnització';

  @override
  String get vacationPay => 'Vacances pendents';

  @override
  String get severanceTotal => 'Total aproximat';

  @override
  String get severanceNote =>
      'Estimació bruta per a contractes signats des del 12 de febrer de 2012. El finiquito real inclou també els dies treballats del mes i la part de les pagues extres.';

  @override
  String get premiumFeatureCompare => 'Comparador d\'ofertes de feina';

  @override
  String get premiumSettingsText =>
      'Treu els anuncis i desbloqueja el comparador d\'ofertes.';

  @override
  String get removeAds => 'Treure els anuncis';

  @override
  String get privacyOptions => 'Opcions de privadesa dels anuncis';

  @override
  String get aboutTitle => 'Quant a';

  @override
  String get aboutText =>
      'Calculadores orientatives de nòmina, atur i indemnització segons la normativa espanyola. No substitueixen l\'assessorament d\'un professional.';

  @override
  String get sourceTitle => 'Fonts oficials';

  @override
  String get source1 => 'IRPF – Agència Tributària';

  @override
  String get source2 => 'Cotització – Seguretat Social';

  @override
  String get source3 => 'Prestació per desocupació – SEPE';

  @override
  String get source4 => 'Estatut dels Treballadors (BOE)';

  @override
  String get aboutDisclaimer =>
      'Sueldo Neto és una app independent i no està vinculada a l\'Agència Tributària, la Seguretat Social, el SEPE ni a cap organisme públic.';

  @override
  String version(String p1) {
    return 'Versió $p1';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get premiumBack => 'Tornar';

  @override
  String get premiumHeadline => 'Passa\'t a Premium';

  @override
  String get premiumActive => 'Ja ets Premium. Gràcies pel teu suport!';

  @override
  String get premiumBenefitNoAds => 'Sense anuncis';

  @override
  String premiumMonthly(String p1) {
    return '$p1 al mes';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1, pagament únic per sempre';
  }

  @override
  String get premiumLoading => 'Carregant el preu…';

  @override
  String get premiumStoreUnavailable =>
      'No es pot connectar amb l\'App Store. Torna-ho a provar més tard.';

  @override
  String get premiumRestore => 'Restaura les compres';

  @override
  String get premiumLegal =>
      'La subscripció es renova cada mes i la pots cancel·lar quan vulguis a l\'App Store.';

  @override
  String get lockedWatchAd => 'Mira un anunci i desbloqueja-ho 24 h';

  @override
  String get lockedGoPremium => 'Fes-te Premium';

  @override
  String get rewardedUnavailable =>
      'Ara mateix no hi ha cap anunci disponible. Prova-ho d\'aquí a una estona.';

  @override
  String get privacyPolicy => 'Política de privadesa';

  @override
  String get termsOfUse => 'Termes d\'ús';
}
