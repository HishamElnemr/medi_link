import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';
import 'package:medi_link/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo, this.fireStoreRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  final FireStoreRepoImpl fireStoreRepo;
  Future<UserAuthEntity?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String role,
    required BuildContext context,
  }) async {
    emit(SignupLoading());
    try {
      final result = await authRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        context: context,
        role: role,
      );

      return result.fold(
        (failure) {
          emit(SignupFailure(message: failure.message));
          return null;
        },
        (userAuthEntity) async {
          await fireStoreRepo.getUserDataAndSaveRole(userAuthEntity.uId);
          emit(SignupSuccess(userAuthEntity: userAuthEntity));
          return userAuthEntity;
        },
      );
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
      return null;
    }
  }
}
