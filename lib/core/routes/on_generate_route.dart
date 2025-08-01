import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/routes/route_transitions.dart';
import 'package:medi_link/features/auth/presentation/views/login_view.dart';
import 'package:medi_link/features/auth/presentation/views/signup_view.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/doctor_home_view.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/patient_home_view.dart';
import 'package:medi_link/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.splash:
      return fadeScaleRoute(const SplashView(), settings);

    case RoutesName.login:
      return slideFromRightRoute(const LoginView(), settings);

    case RoutesName.signup:
      return slideFromRightRoute(const SignupView(), settings);

    case RoutesName.patientHome:
      return slideFromRightRoute( const PatientHomeView(), settings);

    // case RoutesName.doctorHome:
    //   return slideFromRightRoute(const DoctorHomeView(), settings);

    

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
