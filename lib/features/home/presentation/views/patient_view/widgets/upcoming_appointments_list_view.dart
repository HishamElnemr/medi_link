import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_widget.dart';

class UpcomingAppointmentsListView extends StatelessWidget {
  final List<Map<String, dynamic>> appointments;

  const UpcomingAppointmentsListView({required this.appointments, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: appointments.asMap().entries.map((e) {
          int index = e.key;
          final appointment = e.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: UpcomingAppointmentsWidget(
              doctorName: appointment['doctorName'],
              specialty: appointment['specialty'],
              date: appointment['date'],
              onCancelPressed: () {
                // Handle cancel action
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
