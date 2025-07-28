import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/medical_specialties_grid.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/home_app_bar.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: FontStyles.medium20.copyWith(color: AppColors.darkGrey),
              ),
              Text(
                S.of(context).see_all,
                style: FontStyles.regular14.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const MedicalSpecialtiesGrid(),
        ],
      ),
    );
  }
}
