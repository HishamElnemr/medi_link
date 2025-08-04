import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/models/booking_status.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/status_state.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientCard extends StatelessWidget {
  final BookingEntity booking;

  const PatientCard({super.key, required this.booking});

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
          // اسم المريض
          AutoSizeText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            booking.patientName.toUpperCase(),
            style: FontStyles.medium15.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // عمر المريض
          Text(
            '${booking.patientAge} ${S.of(context).years}',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 8),

          // تاريخ الحجز
          Text(
            'التاريخ: ${_formatDate(booking.date)}',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 8),

          // حالة الحجز
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

          StatusState(booking: booking),
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

