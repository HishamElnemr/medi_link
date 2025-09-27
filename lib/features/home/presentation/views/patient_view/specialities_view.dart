import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/medical_specialties_grid_body.dart';

class SpecialitiesView extends StatelessWidget {
  const SpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MedicalSpecialtiesGridBody(),
    );
  }
}
