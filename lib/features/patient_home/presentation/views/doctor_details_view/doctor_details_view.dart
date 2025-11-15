import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_info_card.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_name_card.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DoctorEntity;
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).doctor_details,
        backgroundColor: AppColors.softBlue5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
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
                      SizedBox(width: 16),
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
                  const SizedBox(height: 12),
                  DoctorNameCard(
                    firstName: args.firstName,
                    lastName: args.lastName,
                    speciality: AllSpecialtyUtils.getLocalizedSpecialty(
                      context,
                      args.speciality,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
