import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_info.dart';
import 'l10n/app_localizations.dart';
import 'monetization/monetization.dart';
import 'ui/root.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final monetization = await Monetization.create();
  runApp(App(monetization: monetization));
}

class App extends StatelessWidget {
  const App({super.key, required this.monetization});

  final Monetization monetization;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppInfo.name,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L.supportedLocales,
      home: Root(monetization: monetization),
    );
  }
}
