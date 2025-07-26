import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_link/core/errors/exceptions.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/core/services/firebase_auth_services.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';
import 'package:medi_link/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserAuthEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserAuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var result = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result != null) {
        UserAuthEntity userAuthEntity = UserAuthEntity(
          name: result.displayName ?? '',
          email: result.email ?? '',
          uId: result.uid,
        );
        return Right(userAuthEntity);
      } else {
        return left(ServerFailure('المستخدم غير موجود قم بانشاء حساب'));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما يرجى المحاولة لاحقاً'));
    }
  }
}

void deleteUser(User? user) {
  if (user != null) {
    user.delete();
  }
}
