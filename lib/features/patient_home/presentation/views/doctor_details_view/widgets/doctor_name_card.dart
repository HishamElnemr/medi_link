import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorNameCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String speciality;
  final String hospitalName;

  const DoctorNameCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.speciality,
    required this.hospitalName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Doctor Name
                Text(
                  '${S.of(context).dr} $firstName $lastName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),

                // Specialty & Hospital
                Row(
                  children: [
                    // Specialty
                    Flexible(
                      child: Text(
                        speciality,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FontStyles.medium15.copyWith(
                          color: AppColors.softBlue3,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Hospital
                    Flexible(
                      child: Text(
                        hospitalName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FontStyles.medium15.copyWith(
                          color: AppColors.darkGrey.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
