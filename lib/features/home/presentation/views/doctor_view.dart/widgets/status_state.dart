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
                onPressed: () {
                  context.read<BookingCubit>().rejectBooking(booking.id);
                },
                text: S.of(context).reject,
                height: 40,
                backgroundColor: Colors.red,
                style: FontStyles.medium15.copyWith(color: AppColors.white),
              ),
            ),
          ],
        );

      case 'approved':
        return CustomButton(
          onPressed: () {
            context.read<BookingCubit>().completeBooking(booking.id);
          },
          text: 'إنهاء الحجز',
          height: 40,
          backgroundColor: Colors.blue,
          style: FontStyles.medium15.copyWith(color: AppColors.white),
        );

      case 'completed':
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'تم إنهاء الحجز',
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
            'تم رفض الحجز',
            style: FontStyles.medium15.copyWith(color: Colors.red),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
