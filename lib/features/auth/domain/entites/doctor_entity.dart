import 'dart:io';

import 'package:medi_link/core/models/user_entity.dart';

class DoctorEntity extends UserEntity {
  final String speciality;
  final int phoneNumber;
  final String address;
  final File image;
  final int sallary;
  final int yearsOfExperience;
  final String hospitalName;
  final String biography;

  String? imageUrl;
  DoctorEntity({
    required this.speciality,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.age,
    required super.gender,
    required this.sallary,
    required this.yearsOfExperience,
    required this.hospitalName,
    required this.phoneNumber,
    required this.address,
    required this.image,
    required this.biography,
    this.imageUrl,
  });
}
