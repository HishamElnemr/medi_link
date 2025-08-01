import 'package:medi_link/core/models/user_entity.dart';

class DoctorEntity extends UserEntity {
  final String speciality;
  final int phoneNumber;
  final String address;
    DoctorEntity({
    required this.speciality,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.age,
    required super.gender,
    required this.phoneNumber,
    required this.address
  });
}
