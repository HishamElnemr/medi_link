import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/data/repos/images_repo_impl.dart';
import 'package:medi_link/features/doctor_home/presentation/cubits/update_doctor_data/update_doctor_data_cubit.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_personal_information/widgets/doctor_personal_information_view_body.dart';

class DoctorPersonalInformationView extends StatelessWidget {
  const DoctorPersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDoctorDataCubit(
        getIt<FireStoreRepoImpl>(),
        getIt<ImagesRepoImpl>(),
      ),
      child: const Scaffold(body: DoctorPersonalInformationViewBody()),
    );
  }
}
