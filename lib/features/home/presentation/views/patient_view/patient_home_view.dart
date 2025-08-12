import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/patient_home_view_body.dart';

import '../../cubits/get_all_doctors/get_all_doctors_cubit.dart';

class PatientHomeView extends StatefulWidget {
  const PatientHomeView({super.key});

  @override
  State<PatientHomeView> createState() => _PatientHomeViewState();
}

class _PatientHomeViewState extends State<PatientHomeView> {
  @override
  void initState() {
    context.read<GetAllDoctorsCubit>().getAllDoctors();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PatientHomeViewBody()));
  }
}
