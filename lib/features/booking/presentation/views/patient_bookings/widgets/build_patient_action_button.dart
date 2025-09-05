import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientActionButtons extends StatelessWidget {
  final BookingEntity booking;

  const PatientActionButtons({Key? key, required this.booking})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (booking.status.toLowerCase()) {
      case 'pending':
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  S.of(context).pending,
                  textAlign: TextAlign.center,
                  style: FontStyles.light12.copyWith(color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => _showCancelDialog(context),
              text: S.of(context).cancel,
              width: 80,
              height: 35,
              backgroundColor: Colors.red,
              style: FontStyles.medium15.copyWith(color: Colors.white),
            ),
          ],
        );

      case 'approved':
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  S.of(context).approved,
                  textAlign: TextAlign.center,
                  style: FontStyles.light12.copyWith(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => _showCancelDialog(context),
              text: S.of(context).cancel,
              width: 80,
              height: 35,
              backgroundColor: Colors.red,
              style: FontStyles.medium15.copyWith(color: Colors.white),
            ),
          ],
        );

      case 'completed':
        return _buildStatusContainer(
          context,
          icon: Icons.check_circle,
          color: Colors.blue,
          text: S.of(context).completed,
        );

      case 'rejected':
        return _buildStatusContainer(
          context,
          icon: Icons.cancel,
          color: Colors.red,
          text: S.of(context).rejected,
        );

      case 'cancelled':
        return _buildStatusContainer(
          context,
          icon: Icons.block,
          color: Colors.grey,
          text: S.of(context).cancelled,
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStatusContainer(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(text, style: FontStyles.light12.copyWith(color: color)),
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
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
                context.read<BookingCubit>().getPatientBookings(booking.patientId);
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
}
