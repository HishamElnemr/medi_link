import '../../../domain/entites/user_auth_entity.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserAuthEntity userAuthEntity;
  LoginSuccess({required this.userAuthEntity});
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}
