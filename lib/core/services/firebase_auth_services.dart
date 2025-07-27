import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/errors/exceptions.dart';
import 'package:medi_link/generated/l10n.dart';

class FirebaseAuthServices {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
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
        throw CustomException(message: S.of(context).week_password);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: S.of(context).email_used_before);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: S.of(context).check_your_internet_connection,
        );
      } else {
        throw CustomException(message: S.of(context).something_went_wrong);
      }
    } catch (e) {
      log(
        'Exception from firebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: S.of(context).something_went_wrong);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw CustomException(message: S.of(context).something_went_wrong);
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} – ${e.message}');

      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential' ||
          e.code == 'invalid-email') {
        throw CustomException(
          message: S.of(context).email_or_password_incorrect,
        );
      }
      if (e.code == 'user-disabled') {
        throw CustomException(message: S.of(context).account_disabled);
      }
      if (e.code == 'too-many-requests') {
        throw CustomException(message: S.of(context).too_many_requests);
      }
      if (e.code == 'network-request-failed') {
        throw CustomException(
          message: S.of(context).check_your_internet_connection,
        );
      }

      throw CustomException(message: S.of(context).something_went_wrong);
    } on CustomException {
      rethrow;
    } catch (e, st) {
      log('Exception from signInWithEmailAndPassword: $e\n$st');
      throw CustomException(message: S.of(context).something_went_wrong);
    }
  }

  bool isLoggedIn() => FirebaseAuth.instance.currentUser != null;
}
