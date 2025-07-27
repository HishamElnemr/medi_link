import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/widgets/custom_modal_progress_hud.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, RoutesName.home);
          buildSnackBar(context, S.of(context).account_created_successfully);
        }
        if (state is LoginFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          isLoading: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
