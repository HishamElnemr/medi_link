import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/models/booking_status.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/patient_action_button.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingCard extends StatelessWidget {
  final BookingEntity booking;

  const PatientBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        border: Border.all(color: AppColors.softBlue1, width: 1),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  '${S.of(context).dr} ${booking.doctorName} '.toUpperCase(),
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CachedNetworkImageWidget(imageUrl: booking.doctorImageUrl),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '${S.of(context).doctor_specialization} : ${AllSpecialtyUtils.getLocalizedSpecialty(context, booking.doctorSpeciality)} '
                .toUpperCase(),
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 8),

          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '${S.of(context).patient_name} : ${booking.patientName}',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 8),

          Text(
            '${S.of(context).date}: ${_formatDate(booking.date)}',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Icon(
                BookingStatusHelper.getStatusIcon(booking.status),
                size: 16,
                color: BookingStatusHelper.getStatusColor(booking.status),
              ),
              const SizedBox(width: 4),
              Text(
                BookingStatusHelper.getLocalizedStatus(context, booking.status),
                style: FontStyles.light12.copyWith(
                  color: BookingStatusHelper.getStatusColor(booking.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          PatientActionButtons(booking: booking),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
