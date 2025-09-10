
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          buildSnackBar(context, state.message);
        } else if (state is SignupSuccess) {
          final role = state.userAuthEntity.role;
          if (role == BackendEndpoints.patientsEndpoint) {
            Navigator.pushReplacementNamed(context, RoutesName.patientHome);
          } else {
            Navigator.pushReplacementNamed(context, RoutesName.doctorHome);
          }

          buildSnackBar(context, S.of(context).account_created_successfully);
        }
      },
      builder: (context, state) {
        if (state is SignupLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SignupViewBody();
      },
    );
  }
}

