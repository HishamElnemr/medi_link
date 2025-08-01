import 'package:medi_link/core/models/user_model.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';

class DoctorModel extends UserModel {
  final String speciality;
  final int phoneNumber;
  final String address;
  DoctorModel({
    required this.speciality,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.age,
    required super.gender,
    required this.phoneNumber,
    required this.address,
  });

  DoctorEntity toEntity() => DoctorEntity(
    speciality: speciality,
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    age: age,
    gender: gender,
    phoneNumber: phoneNumber,
    address: address,
  );

  factory DoctorModel.fromEntity(DoctorEntity entity) => DoctorModel(
    speciality: entity.speciality,
    id: entity.id,
    firstName: entity.firstName,
    lastName: entity.lastName,
    email: entity.email,
    age: entity.age,
    gender: entity.gender,
    phoneNumber: entity.phoneNumber,
    address: entity.address,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    speciality: json['speciality'],
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    age: json['age'],
    gender: json['gender'],
    phoneNumber: json['phoneNumber'],
    address: json['address'],
  );

  Map<String, dynamic> toJson() => {
    'speciality': speciality,
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'age': age,
    'gender': gender,
    'phoneNumber': phoneNumber,
    'address': address,
  };

  Map<String, dynamic> toMap() 
  {
    return {
      'speciality': speciality,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
