import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/upcoming_appointments_card.dart';

class UpcomingAppointementsSkeltonizerLoadingBody extends StatelessWidget {
  const UpcomingAppointementsSkeltonizerLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: UpcomingAppointmentsCard(
              onCancelPressed: () {},
              booking: BookingEntity(
                id: '',
                patientId: '',
                doctorId: '',
                patientName: 'ali',
                doctorName: 'mohamed mohamed',
                date: DateFormat('d MMM').format(DateTime.parse('2023-01-01')),
                status: 'pending',
                patientAge: 20,
                doctorSpeciality: 'cardiologist',
                doctorImageUrl: '',
                sallary: 50,
              ),
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
