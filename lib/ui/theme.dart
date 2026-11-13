import 'package:flutter/material.dart';

const _seed = Color(0xFF4A3AA8);

ThemeData lightTheme() => ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed));

ThemeData darkTheme() => ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark));

/// Colores fijos del desglose de la nómina, legibles en claro y oscuro.
class BreakdownColors {
  BreakdownColors._();

  static const net = Color(0xFF2E7D32);
  static const socialSecurity = Color(0xFF1565C0);
  static const withholding = Color(0xFFE65100);
}
