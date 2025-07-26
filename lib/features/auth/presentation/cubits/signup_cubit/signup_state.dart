part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupFailure extends SignupState {
  final String message;
  SignupFailure({
    required this.message,
  });
}

final class SignupSuccess extends SignupState 
{
  UserAuthEntity userAuthEntity;
  SignupSuccess({
    required this.userAuthEntity,
  });
}
