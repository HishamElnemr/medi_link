import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_list_view_bloc_builder.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/medical_specialties_grid.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/specialities_widget.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/upcoming_appointments.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 40),
              const UpcomingAppointments(),
              const SizedBox(height: 20),
              const SpecialitiesWidget(),
              const SizedBox(height: 10),
              const MedicalSpecialtiesGrid(),
              const SizedBox(height: 20),
              const DoctorListViewBuilder(),
              const SizedBox(height: 24),
            ]),
          ),
        ),
      ],
    );
  }
}
