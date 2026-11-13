// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class LGl extends L {
  LGl([String locale = 'gl']) : super(locale);

  @override
  String get settings => 'Axustes';

  @override
  String get tabSalary => 'Nómina';

  @override
  String get tabCompare => 'Comparar ofertas';

  @override
  String get tabUnemployment => 'Paro';

  @override
  String get tabSeverance => 'Despedimento';

  @override
  String get grossAnnual => 'Soldo bruto anual';

  @override
  String get payments14 => '14 pagas';

  @override
  String get payments12 => '12 pagas';

  @override
  String get contractPermanent => 'Indefinido';

  @override
  String get contractTemporary => 'Temporal';

  @override
  String get children => 'Fillos a cargo';

  @override
  String get childrenUnder3 => 'Deles, menores de 3 anos';

  @override
  String get netMonthly => 'Neto ao mes';

  @override
  String netExtraPay(String p1) {
    return 'Cada paga extra: $p1';
  }

  @override
  String get netAnnual => 'Neto ao ano';

  @override
  String get socialSecurity => 'Seguridade Social';

  @override
  String withholding(String p1) {
    return 'IRPF ($p1)';
  }

  @override
  String salaryNote(int p1) {
    return 'Cálculo orientativo coas retencións de $p1 para un contribuínte sen cónxuxe a cargo, sen discapacidade e cos fillos compartidos co outro proxenitor. Non vale para o País Vasco nin Navarra. A túa nómina pode variar segundo o teu convenio e a túa situación persoal.';
  }

  @override
  String get compareTitle => 'Compara dúas ofertas';

  @override
  String get compareLocked =>
      'Mete dous soldos brutos e mira cal che deixa máis diñeiro cada mes e canto da suba chega ao teu peto.';

  @override
  String get offerA => 'Oferta A (bruto anual)';

  @override
  String get offerB => 'Oferta B (bruto anual)';

  @override
  String get offerANet => 'Oferta A, neto ao mes';

  @override
  String get offerBNet => 'Oferta B, neto ao mes';

  @override
  String compareDifference(String p1, String p2, String p3) {
    return '$p1 déixache $p2 máis ao mes ($p3 ao ano)';
  }

  @override
  String compareKept(int p1) {
    return 'De cada 100 € brutos de diferenza quédanche $p1 €.';
  }

  @override
  String get unemploymentBase => 'Base de cotización media mensual';

  @override
  String get unemploymentBaseHelp =>
      'É a media dos últimos 6 meses. Se non a sabes, usa o teu bruto anual entre 12.';

  @override
  String get unemploymentDays => 'Días cotizados nos últimos 6 anos';

  @override
  String get daysSuffix => 'días';

  @override
  String get unemploymentNoRight =>
      'Con menos de 360 días cotizados non hai paro contributivo. Pode que teñas dereito a un subsidio.';

  @override
  String unemploymentDuration(int p1, int p2) {
    return 'Cobrarías $p1 días (uns $p2 meses)';
  }

  @override
  String get unemploymentFirst180 => 'Primeiros 6 meses (70 %)';

  @override
  String get unemploymentFrom181 => 'Do mes 7 ao 12 (60 %)';

  @override
  String get unemploymentFrom361 => 'Desde o mes 13 (50 %)';

  @override
  String get unemploymentNote =>
      'Importes brutos ao mes, cos límites de 2026. Ao cobrar descóntase a cotización á Seguridade Social e, se cómpre, o IRPF.';

  @override
  String get startDate => 'Data de alta';

  @override
  String get endDate => 'Data de baixa';

  @override
  String get dismissalUnfair => 'Despedimento improcedente (33 días por ano)';

  @override
  String get dismissalObjective => 'Despedimento obxectivo (20 días por ano)';

  @override
  String get dismissalTemporary => 'Fin de contrato temporal (12 días por ano)';

  @override
  String get dismissalNone => 'Baixa voluntaria (sen indemnización)';

  @override
  String get vacationDays => 'Días de vacacións sen gozar';

  @override
  String get yearsWorked => 'Anos traballados';

  @override
  String get compensation => 'Indemnización';

  @override
  String get vacationPay => 'Vacacións pendentes';

  @override
  String get severanceTotal => 'Total aproximado';

  @override
  String get severanceNote =>
      'Estimación bruta para contratos asinados desde o 12 de febreiro de 2012. O finiquito real inclúe ademais os días traballados do mes e a parte das pagas extras.';

  @override
  String get premiumFeatureCompare => 'Comparador de ofertas de traballo';

  @override
  String get premiumSettingsText =>
      'Quita os anuncios e desbloquea o comparador de ofertas.';

  @override
  String get removeAds => 'Quitar anuncios';

  @override
  String get privacyOptions => 'Opcións de privacidade dos anuncios';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutText =>
      'Calculadoras orientativas de nómina, paro e indemnización segundo a normativa española. Non substitúen o asesoramento dun profesional.';

  @override
  String get sourceTitle => 'Fontes oficiais';

  @override
  String get source1 => 'IRPF – Axencia Tributaria';

  @override
  String get source2 => 'Cotización – Seguridade Social';

  @override
  String get source3 => 'Prestación por desemprego – SEPE';

  @override
  String get source4 => 'Estatuto dos Traballadores (BOE)';

  @override
  String get aboutDisclaimer =>
      'Sueldo Neto é unha app independente e non está vinculada á Axencia Tributaria, á Seguridade Social, ao SEPE nin a ningún organismo público.';

  @override
  String version(String p1) {
    return 'Versión $p1';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get premiumBack => 'Volver';

  @override
  String get premiumHeadline => 'Pásate a Premium';

  @override
  String get premiumActive => 'Xa es Premium. Grazas polo teu apoio!';

  @override
  String get premiumBenefitNoAds => 'Sen anuncios';

  @override
  String premiumMonthly(String p1) {
    return '$p1 ao mes';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1, pagamento único para sempre';
  }

  @override
  String get premiumLoading => 'Cargando o prezo…';

  @override
  String get premiumStoreUnavailable =>
      'Non se pode conectar coa App Store. Téntao máis tarde.';

  @override
  String get premiumRestore => 'Restaurar compras';

  @override
  String get premiumLegal =>
      'A subscrición renóvase cada mes e podes cancelala cando queiras na App Store.';

  @override
  String get lockedWatchAd => 'Ver un anuncio e desbloquear 24 h';

  @override
  String get lockedGoPremium => 'Faite Premium';

  @override
  String get rewardedUnavailable =>
      'Agora mesmo non hai ningún anuncio dispoñible. Proba dentro dun anaco.';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get termsOfUse => 'Termos de uso';
}
