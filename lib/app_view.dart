import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/helper/on_generate_route.dart';
import 'package:medi_link/core/helper/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';

class AppView extends StatelessWidget {
  const AppView({super.key, required this.locale});
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primaryBlue,
      ),
      locale: locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      initialRoute: RoutesName.splash,
    );
  }
}
