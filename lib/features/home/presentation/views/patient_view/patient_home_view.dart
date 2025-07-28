import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PatientHomeViewBody()));
  }
}
