import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/generated/l10n.dart';

class UpcomingAppointmentsWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final VoidCallback onCancelPressed;

  const UpcomingAppointmentsWidget({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.onCancelPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 218,
      height: 132,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorName,
            style: FontStyles.regular14.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            specialty,
            style: FontStyles.light12.copyWith(
              color: AppColors.lightGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  date,
                  style: FontStyles.regular14.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                onPressed: onCancelPressed,
                text: S.of(context).cancel,
                width: 70,
                height: 35,
                backgroundColor: Colors.red,
                style: FontStyles.medium15.copyWith(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
