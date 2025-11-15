import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorNameCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String speciality;

  const DoctorNameCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).dr + ' ' + firstName + ' ' + lastName,
            textAlign: TextAlign.center,
            style: FontStyles.medium15.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            speciality,
            textAlign: TextAlign.center,
            style: FontStyles.medium15.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
