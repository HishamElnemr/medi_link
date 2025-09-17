import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/firebase_auth_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/features/splash/presentation/views/widgets/sliding_text.dart';

import '../../../../../core/utils/backend_endpoints.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _logoFadeAnimation;
  late final Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _textFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
    );

    _animationController.forward();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    String? userRole = Prefs.getString(BackendEndpoints.getUserRole);
    bool isLoggedIn = FirebaseAuthServices().isLoggedIn();
    log('Is Logged In: $isLoggedIn');
    log('User Role: $userRole');
    log('Doctor Endpoint: ${BackendEndpoints.doctorEndpoint}');
    log('Patient Endpoint: ${BackendEndpoints.patientsEndpoint}');

    bool isDoctor = userRole == BackendEndpoints.doctorEndpoint;
    if (mounted) {
      if (isLoggedIn) {
        if (isDoctor) {
          Navigator.pushReplacementNamed(context, RoutesName.doctorHome);
        } else {
          Navigator.pushReplacementNamed(context, RoutesName.patientMainView);
        }
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingText(
      logoFade: _logoFadeAnimation,
      textFade: _textFadeAnimation,
    );
  }
}
