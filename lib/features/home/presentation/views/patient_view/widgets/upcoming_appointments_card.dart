import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/generated/l10n.dart';

class UpcomingAppointmentsCard extends StatelessWidget {
  String _formatDate(String date) {
    try {
      return DateFormat('d MMM').format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }

  final BookingEntity booking;
  final VoidCallback onCancelPressed;
  final bool moreThanOne;
  const UpcomingAppointmentsCard({
    required this.onCancelPressed,
    required this.booking,
    this.moreThanOne = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: moreThanOne ? 218 : MediaQuery.of(context).size.width * 0.8,
      height: 132,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            booking.doctorName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FontStyles.regular14.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            AllSpecialtyUtils.getLocalizedSpecialty(
              context,
              booking.doctorSpeciality,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
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
                  _formatDate(booking.date),
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
