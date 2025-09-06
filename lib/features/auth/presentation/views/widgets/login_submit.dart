import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

void onSubmit({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String email,
  required String password,
  required VoidCallback onValidationFailed,
}) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    context.read<LoginCubit>().loginUserWithEmailAndPassword(
      email: email,
      password: password,
      context: context,
    );
  } else {
    onValidationFailed();
  }
}
