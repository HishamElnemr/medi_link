import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_card.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/medical_specialties_grid.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/home_app_bar.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const HomeAppBar(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).specialities,
                  style: FontStyles.medium15.copyWith(color: AppColors.darkGrey,fontSize: 17),
                ),
                Text(
                  S.of(context).see_all,
                  style: FontStyles.light12.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const MedicalSpecialtiesGrid(),
            const SizedBox(height: 24),
            const DoctorsList(),
          ],
        ),
      ),
    );
  }
}
