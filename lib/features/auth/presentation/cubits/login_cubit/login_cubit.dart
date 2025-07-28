import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/presentation/cubits/login_cubit/login_state.dart';

import '../../../domain/repos/auth_repo.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password, context: context,
    );
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userAuthEntity) => emit(LoginSuccess(userAuthEntity: userAuthEntity)),
    );
  }
}
