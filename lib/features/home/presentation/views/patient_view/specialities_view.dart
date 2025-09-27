import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/medical_specialties_grid_body.dart';
import 'package:medi_link/generated/l10n.dart';

class SpecialitiesView extends StatelessWidget {
  const SpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).specialities,
        isVisible: true,
      ),
      body: MedicalSpecialtiesGridBody(),
    );
  }
}
