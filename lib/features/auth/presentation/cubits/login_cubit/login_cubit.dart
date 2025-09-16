import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/presentation/cubits/login_cubit/login_state.dart';
import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/fire_store_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo, required this.fireStoreRepo})
    : super(LoginInitial());
  final AuthRepo authRepo;
  final FireStoreRepo fireStoreRepo;

  Future<void> loginUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
      context: context,
    );
    result.fold((failure) => emit(LoginFailure(message: failure.message)), (
      userAuthEntity,
    ) async {
      await fireStoreRepo.getUserDataAndSaveRole(userAuthEntity.uId);
      emit(LoginSuccess(userAuthEntity: userAuthEntity));
    });
  }
}
