import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/appointment_cancel_button.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_appointment_row.dart';

class UpcomingAppointmentsCard extends StatelessWidget {
  final BookingEntity booking;
  final VoidCallback onCancelPressed;

  const UpcomingAppointmentsCard({
    required this.onCancelPressed,
    required this.booking,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      height: 140,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.blue2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadows: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DoctorAppointmentRow(booking: booking),
            const SizedBox(height: 16),
            AppointmentCancelButton(onPressed: onCancelPressed),
          ],
        ),
      ),
    );
  }
}
