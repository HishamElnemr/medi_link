import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/patients_list_view.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/patient_home_app_bar.dart';

class DoctorHomeViewBody extends StatelessWidget {
  const DoctorHomeViewBody({super.key, required this.patients});
  final List<BookingEntity> patients;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const PatientHomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              PatientsListView(patients: patients),
            ]),
          ),
        ),
      ],
    );
  }
}
