import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/upcoming_appointments_list_view.dart';
import 'package:medi_link/generated/l10n.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for appointments - in real app this would come from state management
    final List<Map<String, dynamic>> appointments = [
      {
        'doctorName': 'د / هشام أحمد',
        'specialty': 'أسنان',
        'date': '24 أكتوبر',
      },
      {'doctorName': 'د / أحمد محمد', 'specialty': 'قلب', 'date': '26 أكتوبر'},
      {'doctorName': 'د / سارة علي', 'specialty': 'جلدية', 'date': '28 أكتوبر'},
    ];

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
        UpcomingAppointmentsListView(appointments: appointments),
      ],
    );
  }
}
