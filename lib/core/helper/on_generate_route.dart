
import 'package:flutter/material.dart';
import 'package:medi_link/core/helper/routes_name.dart';
import 'package:medi_link/features/auth/presentation/views/login_view.dart';
import 'package:medi_link/features/auth/presentation/views/signup_view.dart';
import 'package:medi_link/features/home/presentation/views/home_view.dart';
import 'package:medi_link/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.home:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case RoutesName.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case RoutesName.login:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case RoutesName.signup:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
