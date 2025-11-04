import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_card_actions.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_info_card.dart';

class DoctorCard extends StatelessWidget {
  final void Function() onPressed;
  final VoidCallback onFavPressed;
  final DoctorEntity doctorEntity;
  final bool isFavorite;
  final void Function()? onTap;
  const DoctorCard({
    super.key,
    required this.doctorEntity,
    required this.onFavPressed,
    required this.onPressed,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.softBlue2,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorInfoCard(doctorEntity: doctorEntity),
            const SizedBox(height: 12),
            DoctorCardActions(
              onFavPressed: onFavPressed,
              onPressed: onPressed,
              isFavorite: isFavorite,
            ),
          ],
        ),
      ),
    );
  }
}
