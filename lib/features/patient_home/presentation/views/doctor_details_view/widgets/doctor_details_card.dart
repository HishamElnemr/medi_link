import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_info_card.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_name_card.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorDetailsCard extends StatelessWidget {
  const DoctorDetailsCard({super.key, required this.args});

  final DoctorEntity args;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.softBlue1,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImageWidget(
                imageUrl: args.imageUrl!,
                width: 140,
                height: 140,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorInfoCard(
                      icon: Assets.assetsImagesExperience,
                      title:
                          args.yearsOfExperience.toString() +
                          ' ' +
                          S.of(context).years,
                      description: S.of(context).experience,
                    ),
                    const SizedBox(height: 12),
                    DoctorInfoCard(
                      icon: Assets.assetsImagesAddress,
                      title: S.of(context).address,
                      description: args.address,
                    ),
                    const SizedBox(height: 12),
                    DoctorInfoCard(
                      icon: Assets.assetsImagesPhone,
                      title: S.of(context).phone_number,
                      description: args.phoneNumber.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          DoctorNameCard(
            firstName: args.firstName,
            lastName: args.lastName,
            hospitalName: args.hospitalName,
            speciality: AllSpecialtyUtils.getLocalizedSpecialty(
              context,
              args.speciality,
            ),
          ),
        ],
      ),
    );
  }
}
