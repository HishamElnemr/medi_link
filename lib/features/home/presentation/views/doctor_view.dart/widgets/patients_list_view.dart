import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/patient_card.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({super.key, required this.patients});
  final List <BookingEntity> patients;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: patients.length,
      itemBuilder: (BuildContext context, int index) {
        return PatientCard(
          booking: patients[index],
        );
      }, separatorBuilder: (BuildContext context, int index) { 
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
