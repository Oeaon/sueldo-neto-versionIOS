/// Datos propios de esta app: nombre, web, textos legales y fuentes oficiales.
class AppInfo {
  AppInfo._();

  static const name = 'Sueldo Neto';
  static const privacyUrl = 'https://oeaon.github.io/sueldo-neto/privacy.html';
  static const termsUrl = 'https://oeaon.github.io/sueldo-neto/terms.html';

  /// Fuentes oficiales que se enlazan en Ajustes (lo exigen las tiendas para información de organismos públicos).
  static const officialSources = [
    'https://sede.agenciatributaria.gob.es/Sede/irpf.html',
    'https://www.seg-social.es/wps/portal/wss/internet/Trabajadores/CotizacionRecaudacionTrabajadores/36537',
    'https://www.sepe.es/HomeSepe/Personas/distributiva-prestaciones/quiero-cobrar-el-paro.html',
    'https://www.boe.es/buscar/act.php?id=BOE-A-2015-11430',
  ];
}
