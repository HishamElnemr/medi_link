import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/generated/l10n.dart';

class StatusState extends StatelessWidget {
  const StatusState({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    switch (booking.status.toLowerCase()) {
      case 'pending':
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.read<BookingCubit>().approveBooking(booking.id);
                },
                text: S.of(context).approve,
                height: 40,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                onPressed: () => _showRejectConfirmationDialog(context),
                text: S.of(context).reject,
                height: 40,
                backgroundColor: Colors.red,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ),
          ],
        );

      case 'approved':
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.read<BookingCubit>().completeBooking(booking.id);
                },
                text: S.of(context).complete,
                height: 40,
                backgroundColor: Colors.green,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                onPressed: () => _showCancelConfirmationDialog(context),
                text: S.of(context).cancel,
                height: 40,
                backgroundColor: Colors.red,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ),
          ],
        );

      case 'completed':
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            S.of(context).completed,
            style: FontStyles.medium15.copyWith(color: Colors.green),
          ),
        );

      case 'rejected':
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            S.of(context).rejected,
            style: FontStyles.medium15.copyWith(color: Colors.red),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  void _showRejectConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
              const SizedBox(width: 8),
              Text(
                S.of(context).confirm_cancellation,
                style: FontStyles.medium15.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            S.of(context).are_you_sure_reject_booking,
            style: FontStyles.medium15,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // إغلاق الديالوج
              },
              child: Text(
                S.of(context).no,
                style: FontStyles.medium15.copyWith(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // إغلاق الديالوج
                context.read<BookingCubit>().rejectBooking(booking.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                S.of(context).yes_reject,
                style: FontStyles.medium15.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              const Icon(Icons.cancel_outlined, color: Colors.red, size: 28),
              const SizedBox(width: 8),
              Text(
                S.of(context).confirm_cancellation,
                style: FontStyles.medium15.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            S.of(context).are_you_sure_cancel_booking,
            style: FontStyles.medium15,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // إغلاق الديالوج
              },
              child: Text(
                S.of(context).no,
                style: FontStyles.medium15.copyWith(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // إغلاق الديالوج
                context.read<BookingCubit>().rejectBooking(
                  booking.id,
                ); // أو أي method خاص بالإلغاء
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                S.of(context).yes_cancel,
                style: FontStyles.medium15.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
