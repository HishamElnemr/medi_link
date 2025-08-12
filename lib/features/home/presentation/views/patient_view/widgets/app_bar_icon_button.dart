import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';

class AppBarIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const AppBarIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: AppColors.softBlue1,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.primaryBlue),
      ),
    );
  }
}
