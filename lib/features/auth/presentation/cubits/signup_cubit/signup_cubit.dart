import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';
import 'package:medi_link/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    var result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      context: context,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userAuthEntity) => emit(SignupSuccess(userAuthEntity: userAuthEntity)),
    );
  }
}
