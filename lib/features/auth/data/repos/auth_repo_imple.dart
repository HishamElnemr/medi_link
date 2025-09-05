import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/errors/exceptions.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/core/services/firebase_auth_services.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';
import 'package:medi_link/features/auth/domain/repos/auth_repo.dart';
import 'package:medi_link/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserAuthEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        context: context,
      );
      UserAuthEntity userAuthEntity = UserAuthEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      return Right(userAuthEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log('Exception in createUserWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure(S.of(context).something_went_wrong));
    }
  }

  @override
  Future<Either<Failure, UserAuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var result = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
        context: context,
      );
      UserAuthEntity userAuthEntity = UserAuthEntity(
        name: result.displayName ?? '',
        email: result.email ?? '',
        uId: result.uid,
      );
      return Right(userAuthEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure(S.of(context).something_went_wrong));
    }
  }
}

void deleteUser(User? user) {
  if (user != null) {
    user.delete();
  }
}
