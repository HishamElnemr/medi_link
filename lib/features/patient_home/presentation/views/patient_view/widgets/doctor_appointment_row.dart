import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorAppointmentRow extends StatelessWidget {
  final BookingEntity booking;

  const DoctorAppointmentRow({required this.booking, super.key});

  String _formatDate(String date) {
    try {
      return DateFormat('d MMM').format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImageWidget(
            imageUrl: booking.doctorImageUrl,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${S.of(context).dr} ${booking.doctorName}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: FontStyles.regular14.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.softBlue4.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AllSpecialtyUtils.getLocalizedSpecialty(
                        context,
                        booking.doctorSpeciality,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: FontStyles.light12.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: AppColors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatDate(booking.date),
                          style: FontStyles.regular14.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 1,
                          height: 16,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${booking.sallary} ${S.of(context).egp}',
                          style: FontStyles.regular14.copyWith(
                            color: AppColors.softBlue1,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
