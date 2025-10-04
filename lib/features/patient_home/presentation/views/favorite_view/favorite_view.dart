import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/get_doctors/get_doctors_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/favorite_view/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetDoctorsCubit(fireStoreRepoImpl: getIt<FireStoreRepoImpl>())
                ..getDoctors(),
        ),
      ],
      child: const Scaffold(body: FavoriteViewBody()),
    );
  }
}
