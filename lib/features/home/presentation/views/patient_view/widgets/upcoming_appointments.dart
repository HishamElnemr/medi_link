import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_list_view_builder.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_text_widget.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UpcomingAppointmentsTextWidget(),
        SizedBox(height: 20),
        UpcomingAppointmentsListViewBuilder(),
      ],
    );
  }
}
