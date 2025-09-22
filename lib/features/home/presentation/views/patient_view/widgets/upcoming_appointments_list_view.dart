import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/cancel_booking_dialog.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_card.dart';

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
