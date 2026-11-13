// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get settings => 'Ajustes';

  @override
  String get tabSalary => 'Nómina';

  @override
  String get tabCompare => 'Comparar ofertas';

  @override
  String get tabUnemployment => 'Paro';

  @override
  String get tabSeverance => 'Despido';

  @override
  String get grossAnnual => 'Sueldo bruto anual';

  @override
  String get payments14 => '14 pagas';

  @override
  String get payments12 => '12 pagas';

  @override
  String get contractPermanent => 'Indefinido';

  @override
  String get contractTemporary => 'Temporal';

  @override
  String get children => 'Hijos a cargo';

  @override
  String get childrenUnder3 => 'De ellos, menores de 3 años';

  @override
  String get netMonthly => 'Neto al mes';

  @override
  String netExtraPay(String p1) {
    return 'Cada paga extra: $p1';
  }

  @override
  String get netAnnual => 'Neto al año';

  @override
  String get socialSecurity => 'Seguridad Social';

  @override
  String withholding(String p1) {
    return 'IRPF ($p1)';
  }

  @override
  String salaryNote(int p1) {
    return 'Cálculo orientativo con las retenciones de $p1 para un contribuyente sin cónyuge a cargo, sin discapacidad y con los hijos compartidos con el otro progenitor. No vale para el País Vasco ni Navarra. Tu nómina puede variar según tu convenio y tu situación personal.';
  }

  @override
  String get compareTitle => 'Compara dos ofertas';

  @override
  String get compareLocked =>
      'Mete dos sueldos brutos y mira cuál te deja más dinero cada mes y cuánto de la subida llega a tu bolsillo.';

  @override
  String get offerA => 'Oferta A (bruto anual)';

  @override
  String get offerB => 'Oferta B (bruto anual)';

  @override
  String get offerANet => 'Oferta A, neto al mes';

  @override
  String get offerBNet => 'Oferta B, neto al mes';

  @override
  String compareDifference(String p1, String p2, String p3) {
    return '$p1 te deja $p2 más al mes ($p3 al año)';
  }

  @override
  String compareKept(int p1) {
    return 'De cada 100 € brutos de diferencia te quedan $p1 €.';
  }

  @override
  String get unemploymentBase => 'Base de cotización media mensual';

  @override
  String get unemploymentBaseHelp =>
      'Es la media de los últimos 6 meses. Si no la sabes, usa tu bruto anual entre 12.';

  @override
  String get unemploymentDays => 'Días cotizados en los últimos 6 años';

  @override
  String get daysSuffix => 'días';

  @override
  String get unemploymentNoRight =>
      'Con menos de 360 días cotizados no hay paro contributivo. Puede que tengas derecho a un subsidio.';

  @override
  String unemploymentDuration(int p1, int p2) {
    return 'Cobrarías $p1 días (unos $p2 meses)';
  }

  @override
  String get unemploymentFirst180 => 'Primeros 6 meses (70 %)';

  @override
  String get unemploymentFrom181 => 'Del mes 7 al 12 (60 %)';

  @override
  String get unemploymentFrom361 => 'Desde el mes 13 (50 %)';

  @override
  String get unemploymentNote =>
      'Importes brutos al mes, con los topes de 2026. Al cobrar se descuenta la cotización a la Seguridad Social y, si toca, el IRPF.';

  @override
  String get startDate => 'Fecha de alta';

  @override
  String get endDate => 'Fecha de baja';

  @override
  String get dismissalUnfair => 'Despido improcedente (33 días por año)';

  @override
  String get dismissalObjective => 'Despido objetivo (20 días por año)';

  @override
  String get dismissalTemporary => 'Fin de contrato temporal (12 días por año)';

  @override
  String get dismissalNone => 'Baja voluntaria (sin indemnización)';

  @override
  String get vacationDays => 'Días de vacaciones sin disfrutar';

  @override
  String get yearsWorked => 'Años trabajados';

  @override
  String get compensation => 'Indemnización';

  @override
  String get vacationPay => 'Vacaciones pendientes';

  @override
  String get severanceTotal => 'Total aproximado';

  @override
  String get severanceNote =>
      'Estimación bruta para contratos firmados desde el 12 de febrero de 2012. El finiquito real incluye además los días trabajados del mes y la parte de las pagas extras.';

  @override
  String get premiumFeatureCompare => 'Comparador de ofertas de trabajo';

  @override
  String get premiumSettingsText =>
      'Quita los anuncios y desbloquea el comparador de ofertas.';

  @override
  String get removeAds => 'Quitar anuncios';

  @override
  String get privacyOptions => 'Opciones de privacidad de anuncios';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutText =>
      'Calculadoras orientativas de nómina, paro e indemnización según la normativa española. No sustituyen el asesoramiento de un profesional.';

  @override
  String get sourceTitle => 'Fuentes oficiales';

  @override
  String get source1 => 'IRPF – Agencia Tributaria';

  @override
  String get source2 => 'Cotización – Seguridad Social';

  @override
  String get source3 => 'Prestación por desempleo – SEPE';

  @override
  String get source4 => 'Estatuto de los Trabajadores (BOE)';

  @override
  String get aboutDisclaimer =>
      'Sueldo Neto es una app independiente y no está vinculada a la Agencia Tributaria, la Seguridad Social, el SEPE ni a ningún organismo público.';

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
  String get premiumActive => 'Ya eres Premium. ¡Gracias por tu apoyo!';

  @override
  String get premiumBenefitNoAds => 'Sin anuncios';

  @override
  String premiumMonthly(String p1) {
    return '$p1 al mes';
  }

  @override
  String premiumLifetime(String p1) {
    return '$p1, pago único para siempre';
  }

  @override
  String get premiumLoading => 'Cargando precio…';

  @override
  String get premiumStoreUnavailable =>
      'No se puede conectar con el App Store. Inténtalo más tarde.';

  @override
  String get premiumRestore => 'Restaurar compras';

  @override
  String get premiumLegal =>
      'La suscripción se renueva cada mes y puedes cancelarla cuando quieras en el App Store.';

  @override
  String get lockedWatchAd => 'Ver un anuncio y desbloquear 24 h';

  @override
  String get lockedGoPremium => 'Hazte Premium';

  @override
  String get rewardedUnavailable =>
      'No hay ningún anuncio disponible ahora mismo. Prueba dentro de un rato.';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfUse => 'Términos de uso';
}
