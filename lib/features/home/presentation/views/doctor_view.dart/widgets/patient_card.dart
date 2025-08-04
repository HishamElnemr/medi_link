import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientCard extends StatelessWidget {
  final String patientName;
  final int patientAge;
  final VoidCallback onApprovePressed;

  const PatientCard({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.onApprovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        border: Border.all(color: AppColors.softBlue1, width: 1),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            patientName,
            style: FontStyles.medium15.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$patientAge ${S.of(context).years}',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  onPressed: onApprovePressed,
                  text: S.of(context).approve,
                  width: 120,
                  height: 40,
                  style: FontStyles.medium15.copyWith(color: AppColors.white),
                ),
                const SizedBox(width: 12),
                CustomButton(
                  onPressed: onApprovePressed,
                  text: S.of(context).reject,
                  width: 120,
                  height: 40,
                  style: FontStyles.medium15.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
