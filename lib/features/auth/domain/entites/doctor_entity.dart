import 'package:medi_link/core/models/user_entity.dart';

class DoctorEntity extends UserEntity {
  final String speciality;
  DoctorEntity({
    required this.speciality,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.age,
    required super.gender,
  });
}
