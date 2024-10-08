import 'package:flutter/material.dart';
import 'package:flutter_bytebank/_core/constants/bytebank_routes.dart';
import 'package:flutter_bytebank/_core/decorations/bytebank_theme_data.dart';
import 'package:flutter_bytebank/generated/l10n/app_localizations.dart';
import 'package:flutter_bytebank/home/screens/home_page.dart';
import 'package:flutter_bytebank/statement/screens/statement_page.dart';
import 'package:flutter_bytebank/transfers/screens/transfers_page.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  Locale? _locale = Locale('pt', 'BR');

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', '');
    return MaterialApp(
      locale: _locale ,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (_locale != null) {
          return _locale;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      theme: getBytebankThemeData(),
      initialRoute: BytebankRoutes.home,
      routes: {
        BytebankRoutes.home: (context) => const HomePage(),
        BytebankRoutes.transfers: (context) => const TransfersPage(),
        BytebankRoutes.statement: (context) => const StatementPage(),
      },
    );
  }
}
