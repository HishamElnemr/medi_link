import 'package:flutter/material.dart';
import 'package:medi_link/core/models/booking_status.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/cancellable_booking_actions.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/status_container.dart';

class PatientActionButtons extends StatelessWidget {
  final BookingEntity booking;

  const PatientActionButtons({Key? key, required this.booking})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = booking.status.toLowerCase();

    switch (status) {
      case 'pending':
      case 'approved':
        return CancellableBookingActions(
          booking: booking,
          statusText: BookingStatusHelper.getLocalizedStatus(context, status),
          statusColor: BookingStatusHelper.getStatusColor(status),
        );

      case 'completed':
      case 'rejected':
      case 'cancelled':
        return StatusContainer(
          icon: BookingStatusHelper.getStatusIcon(status),
          color: BookingStatusHelper.getStatusColor(status),
          text: BookingStatusHelper.getLocalizedStatus(context, status),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
