import 'package:flutter/material.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/cancel_booking_dialog.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/upcoming_appointments_card.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';

class UpcomingAppointmentsListView extends StatelessWidget {
  final List<BookingEntity> appointments;

  const UpcomingAppointmentsListView({required this.appointments, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: UpcomingAppointmentsCard(
              moreThanOne: appointments.length > 1,
              booking: appointment,
              onCancelPressed: () {
                showCancelBookingDialog(context, appointment);
              },
            ),
          );
        },
      ),
    );
  }
}
