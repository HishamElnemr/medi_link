import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

import '../../../../../../generated/l10n.dart';

class DoctorInfoCard extends StatelessWidget {
  final DoctorEntity doctorEntity;

  const DoctorInfoCard({
    super.key,
    required this.doctorEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              CachedNetworkImageWidget(imageUrl: doctorEntity.imageUrl!),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            S.of(context).dr +
                                ' ' +
                                doctorEntity.firstName +
                                ' ' +
                                doctorEntity.lastName,
                            style: FontStyles.medium15.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '${doctorEntity.age} ${S.of(context).years}',
                          style: FontStyles.light12,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AllSpecialtyUtils.getLocalizedSpecialty(
                              context,
                              doctorEntity.speciality,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FontStyles.regular14.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                        Text(
                          '${doctorEntity.sallary} ${S.of(context).egp}',
                          style: FontStyles.regular14.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
