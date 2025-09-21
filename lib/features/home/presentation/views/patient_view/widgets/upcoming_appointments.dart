import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_list_view_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).upcoming_appointments,
          style: FontStyles.medium15.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 20),
        const UpcomingAppointmentsListViewBuilder(),
      ],
    );
  }
}
