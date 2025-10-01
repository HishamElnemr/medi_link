import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/route_transitions.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/features/auth/presentation/views/login_view.dart';
import 'package:medi_link/features/auth/presentation/views/signup_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/booking_view/booking_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/patient_booking_view.dart';
import 'package:medi_link/features/doctor_home/doctor_view.dart/doctor_home_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_main_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/doctors_by_speciality_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/patient_home_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/specialities_view.dart';
import 'package:medi_link/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.mainView:
      return slideFromRightRoute(const PatientMainView(), settings);

    case RoutesName.splash:
      return fadeScaleRoute(const SplashView(), settings);

    case RoutesName.login:
      return slideFromRightRoute(const LoginView(), settings);

    case RoutesName.signup:
      return slideFromRightRoute(const SignupView(), settings);

    case RoutesName.patientHome:
      return slideFromRightRoute(const PatientHomeView(), settings);

    case RoutesName.patientMainView:
      return slideFromRightRoute(const PatientMainView(), settings);

    case RoutesName.booking:
      return slideFromRightRoute(const BookingView(), settings);

    case RoutesName.doctorHome:
      return slideFromRightRoute(const DoctorHomeView(), settings);
    case RoutesName.patientBooking:
      return slideFromRightRoute(const PatientBookingView(), settings);
    case RoutesName.specialitiesView:
      return slideFromRightRoute(const SpecialitiesView(), settings);

    case RoutesName.doctorsBySpecialityView:
      return slideFromRightRoute(const DoctorsBySpecialityView(), settings);

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
