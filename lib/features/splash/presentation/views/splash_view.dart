import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:medi_link/core/constants/app_colors.dart';
=======
import 'package:medi_link/constants/app_colors.dart';
>>>>>>> 6ff2a329c7cee14d5612f3d42022bab0568795ed
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
