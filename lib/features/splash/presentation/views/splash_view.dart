import 'package:flutter/material.dart';
import 'package:medi_link/constants/app_colors.dart';
import 'package:medi_link/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.softBlue4,
      body: SplashViewBody(),
    );
  }
}
