import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/cancellable_booking_actions.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/status_container.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientActionButtons extends StatelessWidget {
  final BookingEntity booking;

  const PatientActionButtons({Key? key, required this.booking})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (booking.status.toLowerCase()) {
      case 'pending':
        return CancellableBookingActions(
          booking: booking,
          statusText: S.of(context).pending,
          statusColor: Colors.orange,
        );

      case 'approved':
        return CancellableBookingActions(
          booking: booking,
          statusText: S.of(context).approved,
          statusColor: Colors.green,
        );

      case 'completed':
        return StatusContainer(
          icon: Icons.check_circle,
          color: Colors.blue,
          text: S.of(context).completed,
        );

      case 'rejected':
        return StatusContainer(
          icon: Icons.cancel,
          color: Colors.red,
          text: S.of(context).rejected,
        );

      case 'cancelled':
        return StatusContainer(
          icon: Icons.block,
          color: Colors.grey,
          text: S.of(context).cancelled,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
