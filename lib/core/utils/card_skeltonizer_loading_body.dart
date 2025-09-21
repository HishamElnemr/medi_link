import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/patient_card.dart';

class CardSkeltonizerLoadingBody extends StatelessWidget {
  const CardSkeltonizerLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: PatientCard(
            booking: BookingEntity(
              id: '13',
              doctorId: 'sd',
              patientId: 'sds',
              date: '24/05/2023',
              status: 'pending',
              patientName: 'Ali Mohamed Ali',
              doctorName: 'Ali Mohamed Ali',
              patientAge: 25,
              doctorSpeciality: 'Cardiologist',
            ),
          ),
        );
      },
      itemCount: 2,
    );
  }
}
