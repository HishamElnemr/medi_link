import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/common_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../cubits/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, required this.isLoading});
  final bool isLoading;
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 30),
              const SizedBox(height: 16),

              CommonFields(
                onEmailSaved: (value) => email = value ?? '',
                onPasswordSaved: (value) => password = value ?? '',
              ),

              const SizedBox(height: 33),
              CustomButton(
                isLoading: widget.isLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().loginUserWithEmailAndPassword(
                      email: email,
                      password: password,
                      context: context,
                    );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: S.of(context).login,
              ),
              const SizedBox(height: 33),
              const Align(
                alignment: Alignment.center,
                child: DontHaveAccountWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
