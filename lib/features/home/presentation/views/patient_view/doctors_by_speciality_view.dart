import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctors_by_speciality_view_body.dart';

class DoctorsBySpecialityView extends StatelessWidget {
  const DoctorsBySpecialityView({super.key});
  @override
  Widget build(BuildContext context) {
     final args = ModalRoute.of(context)?.settings.arguments;
    return BlocProvider(
      create: (context) => GetDoctorBySpecialityCubit(
        fireStoreRepoImpl: getIt<FireStoreRepoImpl>(),
      )..getDoctorsBySpeciality(specialization: args as String),
      child: const Scaffold(body: DoctorsBySpecialityViewBody()),
    );
  }
}
