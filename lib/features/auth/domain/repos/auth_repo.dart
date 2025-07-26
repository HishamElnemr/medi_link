import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserAuthEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserAuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
