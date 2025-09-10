import 'package:firebase_auth/firebase_auth.dart';
import 'package:medi_link/features/auth/domain/entites/user_auth_entity.dart';

class UserAuthModel extends UserAuthEntity {
  UserAuthModel({
    required super.name,
    required super.email,
    required super.uId,
    required super.role,
  });

  factory UserAuthModel.fromFirebaseUser(User user, {required String role}) {
    return UserAuthModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      role: role,
    );
  }

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      role: json['role'] ?? '', // تأكد أنه موجود في الـ json
    );
  }

  factory UserAuthModel.fromEntity(UserAuthEntity userAuthEntity) {
    return UserAuthModel(
      name: userAuthEntity.name,
      email: userAuthEntity.email,
      uId: userAuthEntity.uId,
      role: userAuthEntity.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId, 'role': role};
  }
}
