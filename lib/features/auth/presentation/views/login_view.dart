import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/auth/data/repos/auth_repo_imple.dart';
import 'package:medi_link/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';
import 'package:medi_link/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).login,
        isVisible: false,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(authRepo: getIt<AuthRepoImpl>()),
        child: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}


