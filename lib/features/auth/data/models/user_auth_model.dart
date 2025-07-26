import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';

class UserAuthModel extends UserAuthEntity
{
  UserAuthModel({required super.name, required super.email, required super.uId});
  factory UserAuthModel.fromFirebaseUser(User user) {
    return UserAuthModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }
  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }
  factory UserAuthModel.fromEntity(UserAuthEntity userAuthEntity) {
    return UserAuthModel(
      name: userAuthEntity.name,
      email: userAuthEntity.email,
      uId: userAuthEntity.uId,
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}