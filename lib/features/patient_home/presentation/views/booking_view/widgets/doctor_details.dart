import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';

import '../../../../../../../generated/l10n.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.age,
    required this.imageUrl,
    required this.sallary,
  });
  final String doctorName, speciality, imageUrl;
  final int age, sallary;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.softBlue1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImageWidget(imageUrl: imageUrl),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGrey.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          S.of(context).dr + ' ' + doctorName,
                          style: FontStyles.medium15.copyWith(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '${age} ${S.of(context).years}',
                        style: FontStyles.light12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          speciality,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FontStyles.regular14.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                      Text(
                        '${sallary} ${S.of(context).egp}',
                        style: FontStyles.regular14.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
