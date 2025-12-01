import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/patient_home/presentation/views/edit_profile_view/widgets/patient_personal_information_view_body.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/update_patient_data/update_patient_data_cubit.dart';

class PatientPersonalInformation extends StatelessWidget {
  const PatientPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePatientDataCubit(getIt<FireStoreRepoImpl>()),
      child: const Scaffold(body: PatientPersonalInformationViewBody()),
    );
  }
}
