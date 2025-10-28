import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_doctor_data_cubit/add_doctor_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // 1. اسمع للـ SignupCubit
        BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupFailure) {
              buildSnackBar(context, state.message);
            }
            // لا تعمل navigation هنا، استنى AddDoctorData يخلص
          },
        ),

        // 2. اسمع للـ AddDoctorDataCubit
        BlocListener<AddDoctorDataCubit, AddDoctorDataState>(
          listener: (context, state) {
            if (state is AddDoctorDataSuccess) {
              // دلوقتي انقل بعد ما كل حاجة خلصت
              final signupState = context.read<SignupCubit>().state;
              if (signupState is SignupSuccess) {
                final role = signupState.userAuthEntity.role;
                if (role == BackendEndpoints.patientsEndpoint) {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.patientHome,
                  );
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.doctorHome,
                  );
                }
                buildSnackBar(
                  context,
                  S.of(context).account_created_successfully,
                );
              }
            } else if (state is AddDoctorDataFailure) {
              buildSnackBar(context, state.message);
            }
          },
        ),
      ],
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, signupState) {
          // اعرض loading لو في signup أو doctor data upload
          final addDoctorState = context.watch<AddDoctorDataCubit>().state;
          final isLoading =
              signupState is SignupLoading ||
              addDoctorState is AddDoctorDataLoading;

          return SignupViewBody(isLoading: isLoading);
        },
      ),
    );
  }
}
