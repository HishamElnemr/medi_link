import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class UpcomingAppointmentsTextWidget extends StatelessWidget {
  const UpcomingAppointmentsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).upcoming_appointments,
          style: FontStyles.medium15.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
