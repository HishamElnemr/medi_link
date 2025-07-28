import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/auth/data/repos/auth_repo_imple.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_doctor_data_cubit/add_doctor_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../data/repos/fire_store_repo_imple.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit(getIt<AuthRepoImpl>())),
        BlocProvider(
          create: (context) => AddDoctorDataCubit(getIt<FireStoreRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(context, title: S.of(context).sign_up),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
