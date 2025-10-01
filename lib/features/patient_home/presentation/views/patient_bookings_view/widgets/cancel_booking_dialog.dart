import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/generated/l10n.dart';

void showCancelBookingDialog(BuildContext context, BookingEntity booking) {
  final bookingCubit = context.read<BookingCubit>();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(S.of(context).are_you_sure),
        content: Text(S.of(context).confirm_cancellation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(S.of(context).no),
          ),
          TextButton(
            onPressed: () {
              bookingCubit.cancelBooking(booking.id);
              Navigator.of(dialogContext).pop();
              context.read<BookingCubit>().getPatientBookings(
                booking.patientId,
              );
            },
            child: Text(
              S.of(context).yes,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
