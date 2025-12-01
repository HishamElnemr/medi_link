import 'package:flutter/material.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view/widgets/patient_card.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({super.key, required this.patients});
  final List<BookingEntity> patients;

  @override
  Widget build(BuildContext context) {
    final filteredPatients = patients.where((booking) {
      return booking.status.toLowerCase() != 'rejected';
    }).toList();

    if (filteredPatients.isEmpty) {
      return Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              S.of(context).no_appointment,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredPatients.length,
      itemBuilder: (BuildContext context, int index) {
        return PatientCard(booking: filteredPatients[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 15);
      },
    );
  }
}
