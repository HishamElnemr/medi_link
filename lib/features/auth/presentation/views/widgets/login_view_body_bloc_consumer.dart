import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/widgets/custom_modal_progress_hud.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/doctor_home_view.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../../../../core/utils/backend_endpoints.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        bool isDoctor =
            Prefs.getString(BackendEndpoints.getUserRole) ==
            BackendEndpoints.doctorEndpoint;
        if (state is LoginSuccess) {
          buildSnackBar(context, S.of(context).login_successfully);
          if (isDoctor) {
            //Navigator.pushReplacementNamed(context, RoutesName.doctorHome);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DoctorHomeScreen()),
            );
          } else {
            Navigator.pushReplacementNamed(context, RoutesName.patientHome);
          }
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
