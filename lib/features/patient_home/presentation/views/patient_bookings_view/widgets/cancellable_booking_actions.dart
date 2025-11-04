import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/widgets/custom_button.dart';

import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/cancel_booking_dialog.dart';
import 'package:medi_link/generated/l10n.dart';

class CancellableBookingActions extends StatelessWidget {
  final BookingEntity booking;
  final String statusText;
  final Color statusColor;

  const CancellableBookingActions({
    Key? key,
    required this.booking,
    required this.statusText,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => showCancelBookingDialog(context, booking),
      text: S.of(context).cancel,
      width: double.infinity,
      height: 35,
      backgroundColor: Colors.red,
      style: FontStyles.medium15.copyWith(color: Colors.white),
    );
  }
}
