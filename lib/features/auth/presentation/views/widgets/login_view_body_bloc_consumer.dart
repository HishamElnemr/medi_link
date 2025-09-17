import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/login_view_body.dart';
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
        if (state is LoginSuccess) {
          final role = Prefs.getString(BackendEndpoints.getUserRole);
          if (role == BackendEndpoints.doctorEndpoint) {
            Prefs.getString(BackendEndpoints.kDoctorData);

            Navigator.pushReplacementNamed(context, RoutesName.doctorHome);
          } else if (role == BackendEndpoints.patientsEndpoint) {
            Prefs.getString(BackendEndpoints.kPatientData);

            Navigator.pushReplacementNamed(context, RoutesName.patientMainView);
          } else {
            log(
              '⚠️ BlocConsumer: No valid role found, staying on login screen',
            );
          }
          buildSnackBar(context, S.of(context).login_successfully);
        } else if (state is LoginFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return LoginViewBody(isLoading: state is LoginLoading);
      },
    );
  }
}
