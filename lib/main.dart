import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medi_link/core/helper/on_generate_route.dart';
import 'package:medi_link/core/helper/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';

void main() {
  [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  S.delegate.supportedLocales;
  runApp(const MediLink());
}

class MediLink extends StatelessWidget {
  const MediLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: RoutesName.home,
    );
  }
}
