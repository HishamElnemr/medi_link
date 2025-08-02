import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';

class SelectPatient extends StatelessWidget {
  const SelectPatient({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
    this.borderColor,
    this.textColor,
  });

  final void Function() onTap;
  final String text;
  final bool isSelected;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 35,
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? AppColors.primaryBlue : AppColors.primaryBlue,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: FontStyles.light12.copyWith(
            color: isSelected
                ? AppColors.white
                : (textColor ?? AppColors.primaryBlue),
          ),
        ),
      ),
    );
  }
}
