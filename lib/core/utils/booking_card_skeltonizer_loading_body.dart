import 'package:flutter/material.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view/widgets/patient_card.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';

class BookingCardSkeltonizerLoadingBody extends StatelessWidget {
  const BookingCardSkeltonizerLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
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
              doctorImageUrl: '',
              sallary: 50,
            ),
          ),
        );
      },
      itemCount: 3,
    );
  }
}
