import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/custom_icon.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final double rating;
  final int reviews;
  final void Function() onPressed;
  final VoidCallback? onFavPressed;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.reviews,
    this.onFavPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doctorName,
                      style: FontStyles.medium15.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('45 سنة', style: FontStyles.light12),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.regular14.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              GestureDetector(
                onTap: onFavPressed,
                child: const CustomIcon(icon: Assets.assetsImagesFav),
              ),
              const SizedBox(width: 5),
              const CustomIcon(icon: Assets.assetsImagesAbout),
              const Spacer(),
              CustomButton(
                onPressed: onPressed,
                text: 'حجز موعد',
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

