import 'package:flutter/material.dart';

import '../app_info.dart';
import '../l10n/app_localizations.dart';
import '../monetization/monetization.dart';
import '../monetization/monetization_ui.dart';
import 'compare_tab.dart';
import 'forms.dart';
import 'salary_tab.dart';
import 'settings_screen.dart';
import 'severance_tab.dart';
import 'unemployment_tab.dart';

class Root extends StatefulWidget {
  const Root({super.key, required this.monetization});

  final Monetization monetization;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  // Las pestañas guardan lo escrito aunque se cambie de una a otra.
  final _forms = Forms();
  late final TabController _tabs = TabController(length: 4, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabs.addListener(() {
      // Cambiar de calculadora es una pausa natural (con límite de frecuencia).
      if (!_tabs.indexIsChanging) widget.monetization.maybeShowInterstitial();
    });
    // El consentimiento se pide con la primera pantalla ya dibujada.
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.monetization.gatherConsent());
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  void _openPremium() {
    final l = L.of(context);
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => PremiumScreen(
        monetization: widget.monetization,
        features: [l.premiumFeatureCompare],
        privacyUrl: AppInfo.privacyUrl,
        termsUrl: AppInfo.termsUrl,
      ),
    ));
  }

  void _openSettings() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => SettingsScreen(monetization: widget.monetization, onOpenPremium: _openPremium),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final monetization = widget.monetization;
    return ListenableBuilder(
      listenable: monetization,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text(AppInfo.name),
          actions: [
            PremiumAction(monetization: monetization, onPressed: _openPremium),
            IconButton(onPressed: _openSettings, icon: const Icon(Icons.settings), tooltip: l.settings),
          ],
          bottom: TabBar(
            controller: _tabs,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: l.tabSalary),
              Tab(text: l.tabCompare),
              Tab(text: l.tabUnemployment),
              Tab(text: l.tabSeverance),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabs,
          children: [
            SalaryTab(form: _forms.salary),
            CompareTab(form: _forms.compare, monetization: monetization, onGoPremium: _openPremium),
            UnemploymentTab(form: _forms.unemployment),
            SeveranceTab(form: _forms.severance),
          ],
        ),
        bottomNavigationBar: AdBanner(monetization: monetization),
      ),
    );
  }
}
