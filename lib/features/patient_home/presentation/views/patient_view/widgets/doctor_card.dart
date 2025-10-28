import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/custom_icon.dart';

import '../../../../../../generated/l10n.dart';

class DoctorCard extends StatelessWidget {
  final void Function() onPressed;
  final VoidCallback onFavPressed;
  final DoctorEntity doctorEntity;
  final bool isFavorite;

  const DoctorCard({
    super.key,
    required this.doctorEntity,
    required this.onFavPressed,
    required this.onPressed,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                          Text(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: onFavPressed,
                child: CustomIcon(
                  icon: isFavorite
                      ? Assets.assetsImagesAddToFav
                      : Assets.assetsImagesFav,
                ),
              ),
              const SizedBox(width: 5),
              const CustomIcon(icon: Assets.assetsImagesAbout),
              const Spacer(),
              CustomButton(
                onPressed: onPressed,
                text: S.of(context).book_appointment,
                width: 120,
                height: 40,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
