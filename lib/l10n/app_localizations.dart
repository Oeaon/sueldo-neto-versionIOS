import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_gl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('en'),
    Locale('es'),
    Locale('gl'),
  ];

  /// No description provided for @settings.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settings;

  /// No description provided for @tabSalary.
  ///
  /// In es, this message translates to:
  /// **'Nómina'**
  String get tabSalary;

  /// No description provided for @tabCompare.
  ///
  /// In es, this message translates to:
  /// **'Comparar ofertas'**
  String get tabCompare;

  /// No description provided for @tabUnemployment.
  ///
  /// In es, this message translates to:
  /// **'Paro'**
  String get tabUnemployment;

  /// No description provided for @tabSeverance.
  ///
  /// In es, this message translates to:
  /// **'Despido'**
  String get tabSeverance;

  /// No description provided for @grossAnnual.
  ///
  /// In es, this message translates to:
  /// **'Sueldo bruto anual'**
  String get grossAnnual;

  /// No description provided for @payments14.
  ///
  /// In es, this message translates to:
  /// **'14 pagas'**
  String get payments14;

  /// No description provided for @payments12.
  ///
  /// In es, this message translates to:
  /// **'12 pagas'**
  String get payments12;

  /// No description provided for @contractPermanent.
  ///
  /// In es, this message translates to:
  /// **'Indefinido'**
  String get contractPermanent;

  /// No description provided for @contractTemporary.
  ///
  /// In es, this message translates to:
  /// **'Temporal'**
  String get contractTemporary;

  /// No description provided for @children.
  ///
  /// In es, this message translates to:
  /// **'Hijos a cargo'**
  String get children;

  /// No description provided for @childrenUnder3.
  ///
  /// In es, this message translates to:
  /// **'De ellos, menores de 3 años'**
  String get childrenUnder3;

  /// No description provided for @netMonthly.
  ///
  /// In es, this message translates to:
  /// **'Neto al mes'**
  String get netMonthly;

  /// No description provided for @netExtraPay.
  ///
  /// In es, this message translates to:
  /// **'Cada paga extra: {p1}'**
  String netExtraPay(String p1);

  /// No description provided for @netAnnual.
  ///
  /// In es, this message translates to:
  /// **'Neto al año'**
  String get netAnnual;

  /// No description provided for @socialSecurity.
  ///
  /// In es, this message translates to:
  /// **'Seguridad Social'**
  String get socialSecurity;

  /// No description provided for @withholding.
  ///
  /// In es, this message translates to:
  /// **'IRPF ({p1})'**
  String withholding(String p1);

  /// No description provided for @salaryNote.
  ///
  /// In es, this message translates to:
  /// **'Cálculo orientativo con las retenciones de {p1} para un contribuyente sin cónyuge a cargo, sin discapacidad y con los hijos compartidos con el otro progenitor. No vale para el País Vasco ni Navarra. Tu nómina puede variar según tu convenio y tu situación personal.'**
  String salaryNote(int p1);

  /// No description provided for @compareTitle.
  ///
  /// In es, this message translates to:
  /// **'Compara dos ofertas'**
  String get compareTitle;

  /// No description provided for @compareLocked.
  ///
  /// In es, this message translates to:
  /// **'Mete dos sueldos brutos y mira cuál te deja más dinero cada mes y cuánto de la subida llega a tu bolsillo.'**
  String get compareLocked;

  /// No description provided for @offerA.
  ///
  /// In es, this message translates to:
  /// **'Oferta A (bruto anual)'**
  String get offerA;

  /// No description provided for @offerB.
  ///
  /// In es, this message translates to:
  /// **'Oferta B (bruto anual)'**
  String get offerB;

  /// No description provided for @offerANet.
  ///
  /// In es, this message translates to:
  /// **'Oferta A, neto al mes'**
  String get offerANet;

  /// No description provided for @offerBNet.
  ///
  /// In es, this message translates to:
  /// **'Oferta B, neto al mes'**
  String get offerBNet;

  /// No description provided for @compareDifference.
  ///
  /// In es, this message translates to:
  /// **'{p1} te deja {p2} más al mes ({p3} al año)'**
  String compareDifference(String p1, String p2, String p3);

  /// No description provided for @compareKept.
  ///
  /// In es, this message translates to:
  /// **'De cada 100 € brutos de diferencia te quedan {p1} €.'**
  String compareKept(int p1);

  /// No description provided for @unemploymentBase.
  ///
  /// In es, this message translates to:
  /// **'Base de cotización media mensual'**
  String get unemploymentBase;

  /// No description provided for @unemploymentBaseHelp.
  ///
  /// In es, this message translates to:
  /// **'Es la media de los últimos 6 meses. Si no la sabes, usa tu bruto anual entre 12.'**
  String get unemploymentBaseHelp;

  /// No description provided for @unemploymentDays.
  ///
  /// In es, this message translates to:
  /// **'Días cotizados en los últimos 6 años'**
  String get unemploymentDays;

  /// No description provided for @daysSuffix.
  ///
  /// In es, this message translates to:
  /// **'días'**
  String get daysSuffix;

  /// No description provided for @unemploymentNoRight.
  ///
  /// In es, this message translates to:
  /// **'Con menos de 360 días cotizados no hay paro contributivo. Puede que tengas derecho a un subsidio.'**
  String get unemploymentNoRight;

  /// No description provided for @unemploymentDuration.
  ///
  /// In es, this message translates to:
  /// **'Cobrarías {p1} días (unos {p2} meses)'**
  String unemploymentDuration(int p1, int p2);

  /// No description provided for @unemploymentFirst180.
  ///
  /// In es, this message translates to:
  /// **'Primeros 6 meses (70 %)'**
  String get unemploymentFirst180;

  /// No description provided for @unemploymentFrom181.
  ///
  /// In es, this message translates to:
  /// **'Del mes 7 al 12 (60 %)'**
  String get unemploymentFrom181;

  /// No description provided for @unemploymentFrom361.
  ///
  /// In es, this message translates to:
  /// **'Desde el mes 13 (50 %)'**
  String get unemploymentFrom361;

  /// No description provided for @unemploymentNote.
  ///
  /// In es, this message translates to:
  /// **'Importes brutos al mes, con los topes de 2026. Al cobrar se descuenta la cotización a la Seguridad Social y, si toca, el IRPF.'**
  String get unemploymentNote;

  /// No description provided for @startDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha de alta'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha de baja'**
  String get endDate;

  /// No description provided for @dismissalUnfair.
  ///
  /// In es, this message translates to:
  /// **'Despido improcedente (33 días por año)'**
  String get dismissalUnfair;

  /// No description provided for @dismissalObjective.
  ///
  /// In es, this message translates to:
  /// **'Despido objetivo (20 días por año)'**
  String get dismissalObjective;

  /// No description provided for @dismissalTemporary.
  ///
  /// In es, this message translates to:
  /// **'Fin de contrato temporal (12 días por año)'**
  String get dismissalTemporary;

  /// No description provided for @dismissalNone.
  ///
  /// In es, this message translates to:
  /// **'Baja voluntaria (sin indemnización)'**
  String get dismissalNone;

  /// No description provided for @vacationDays.
  ///
  /// In es, this message translates to:
  /// **'Días de vacaciones sin disfrutar'**
  String get vacationDays;

  /// No description provided for @yearsWorked.
  ///
  /// In es, this message translates to:
  /// **'Años trabajados'**
  String get yearsWorked;

  /// No description provided for @compensation.
  ///
  /// In es, this message translates to:
  /// **'Indemnización'**
  String get compensation;

  /// No description provided for @vacationPay.
  ///
  /// In es, this message translates to:
  /// **'Vacaciones pendientes'**
  String get vacationPay;

  /// No description provided for @severanceTotal.
  ///
  /// In es, this message translates to:
  /// **'Total aproximado'**
  String get severanceTotal;

  /// No description provided for @severanceNote.
  ///
  /// In es, this message translates to:
  /// **'Estimación bruta para contratos firmados desde el 12 de febrero de 2012. El finiquito real incluye además los días trabajados del mes y la parte de las pagas extras.'**
  String get severanceNote;

  /// No description provided for @premiumFeatureCompare.
  ///
  /// In es, this message translates to:
  /// **'Comparador de ofertas de trabajo'**
  String get premiumFeatureCompare;

  /// No description provided for @premiumSettingsText.
  ///
  /// In es, this message translates to:
  /// **'Quita los anuncios y desbloquea el comparador de ofertas.'**
  String get premiumSettingsText;

  /// No description provided for @removeAds.
  ///
  /// In es, this message translates to:
  /// **'Quitar anuncios'**
  String get removeAds;

  /// No description provided for @privacyOptions.
  ///
  /// In es, this message translates to:
  /// **'Opciones de privacidad de anuncios'**
  String get privacyOptions;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get aboutTitle;

  /// No description provided for @aboutText.
  ///
  /// In es, this message translates to:
  /// **'Calculadoras orientativas de nómina, paro e indemnización según la normativa española. No sustituyen el asesoramiento de un profesional.'**
  String get aboutText;

  /// No description provided for @sourceTitle.
  ///
  /// In es, this message translates to:
  /// **'Fuentes oficiales'**
  String get sourceTitle;

  /// No description provided for @source1.
  ///
  /// In es, this message translates to:
  /// **'IRPF – Agencia Tributaria'**
  String get source1;

  /// No description provided for @source2.
  ///
  /// In es, this message translates to:
  /// **'Cotización – Seguridad Social'**
  String get source2;

  /// No description provided for @source3.
  ///
  /// In es, this message translates to:
  /// **'Prestación por desempleo – SEPE'**
  String get source3;

  /// No description provided for @source4.
  ///
  /// In es, this message translates to:
  /// **'Estatuto de los Trabajadores (BOE)'**
  String get source4;

  /// No description provided for @aboutDisclaimer.
  ///
  /// In es, this message translates to:
  /// **'Sueldo Neto es una app independiente y no está vinculada a la Agencia Tributaria, la Seguridad Social, el SEPE ni a ningún organismo público.'**
  String get aboutDisclaimer;

  /// No description provided for @version.
  ///
  /// In es, this message translates to:
  /// **'Versión {p1}'**
  String version(String p1);

  /// No description provided for @premiumTitle.
  ///
  /// In es, this message translates to:
  /// **'Premium'**
  String get premiumTitle;

  /// No description provided for @premiumBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get premiumBack;

  /// No description provided for @premiumHeadline.
  ///
  /// In es, this message translates to:
  /// **'Pásate a Premium'**
  String get premiumHeadline;

  /// No description provided for @premiumActive.
  ///
  /// In es, this message translates to:
  /// **'Ya eres Premium. ¡Gracias por tu apoyo!'**
  String get premiumActive;

  /// No description provided for @premiumBenefitNoAds.
  ///
  /// In es, this message translates to:
  /// **'Sin anuncios'**
  String get premiumBenefitNoAds;

  /// No description provided for @premiumMonthly.
  ///
  /// In es, this message translates to:
  /// **'{p1} al mes'**
  String premiumMonthly(String p1);

  /// No description provided for @premiumLifetime.
  ///
  /// In es, this message translates to:
  /// **'{p1}, pago único para siempre'**
  String premiumLifetime(String p1);

  /// No description provided for @premiumLoading.
  ///
  /// In es, this message translates to:
  /// **'Cargando precio…'**
  String get premiumLoading;

  /// No description provided for @premiumStoreUnavailable.
  ///
  /// In es, this message translates to:
  /// **'No se puede conectar con el App Store. Inténtalo más tarde.'**
  String get premiumStoreUnavailable;

  /// No description provided for @premiumRestore.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compras'**
  String get premiumRestore;

  /// No description provided for @premiumLegal.
  ///
  /// In es, this message translates to:
  /// **'La suscripción se renueva cada mes y puedes cancelarla cuando quieras en el App Store.'**
  String get premiumLegal;

  /// No description provided for @lockedWatchAd.
  ///
  /// In es, this message translates to:
  /// **'Ver un anuncio y desbloquear 24 h'**
  String get lockedWatchAd;

  /// No description provided for @lockedGoPremium.
  ///
  /// In es, this message translates to:
  /// **'Hazte Premium'**
  String get lockedGoPremium;

  /// No description provided for @rewardedUnavailable.
  ///
  /// In es, this message translates to:
  /// **'No hay ningún anuncio disponible ahora mismo. Prueba dentro de un rato.'**
  String get rewardedUnavailable;

  /// No description provided for @privacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In es, this message translates to:
  /// **'Términos de uso'**
  String get termsOfUse;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ca', 'en', 'es', 'gl'].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return LCa();
    case 'en':
      return LEn();
    case 'es':
      return LEs();
    case 'gl':
      return LGl();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
