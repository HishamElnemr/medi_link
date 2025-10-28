import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/generated/l10n.dart';

class AppointmentCancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppointmentCancelButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      text: S.of(context).cancel,
      width: double.infinity,
      height: 32,
      backgroundColor: Colors.red.shade400,
      style: FontStyles.medium15.copyWith(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
