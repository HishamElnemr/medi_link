import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/patient_home_view_body.dart';

import '../../cubits/get_all_doctors/get_all_doctors_cubit.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              GetAllDoctorsCubit(getIt<FireStoreRepoImpl>())..getAllDoctors(),
          child: const PatientHomeViewBody(),
        ),
      ),
    );
  }
}
