import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_link/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException from firebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم من قبل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما يرجى المحاولة لاحقاً');
      }
    } catch (e) {
      log(
        'Exception from firebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ ما يرجى المحاولة لاحقاً');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException from firebaseAuthServices.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'الرقم السري أو البريد الالكتروني غير صحيح',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري أو البريد الالكتروني غير صحيح',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما يرجى المحاولة لاحقاً');
      }
    } catch (e) {
      log(
        'Exception from firebaseAuthServices.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ ما يرجى المحاولة لاحقاً');
    }
  }
}
