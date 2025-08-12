import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';

import '../../../../../../../generated/l10n.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.age,
  });
  final String doctorName, speciality;
  final int age;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.softBlue1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).dr + ' ' + doctorName,
                    style: FontStyles.medium15.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${age} ${S.of(context).years}',
                    style: FontStyles.light12,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                speciality,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FontStyles.regular14.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
