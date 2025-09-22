import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_card.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingListView extends StatelessWidget {
  const PatientBookingListView({super.key, required this.bookings});
  final List<BookingEntity> bookings;

  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            S.of(context).no_appointment,
            style: const TextStyle(fontSize: 16, color: AppColors.primaryBlue),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: PatientBookingCard(booking: bookings[index]),
        );
      },
    );
  }
}
