import 'package:medi_link/core/models/user_model.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';

class PatientModel extends UserModel {
  final String? chronicDiseases;
  final String? medicineTaken;
  PatientModel({
    this.chronicDiseases,
    this.medicineTaken,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.age,
    required super.gender,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    chronicDiseases: json['chronicDiseases'],
    medicineTaken: json['medicineTaken'],
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    age: json['age'],
    gender: json['gender'],
  );

  Map<String, dynamic> toJson() => {
    'chronicDiseases': chronicDiseases,
    'medicineTaken': medicineTaken,
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'age': age,
    'gender': gender,
  };

  PatientEntity toEntity() => PatientEntity(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    age: age,
    gender: gender,
    chronicDiseases: chronicDiseases,
    medicineTaken: medicineTaken,
  );

  factory PatientModel.fromEntity(PatientEntity entity) => PatientModel(
    chronicDiseases: entity.chronicDiseases,
    medicineTaken: entity.medicineTaken,
    id: entity.id,
    firstName: entity.firstName,
    lastName: entity.lastName,
    email: entity.email,
    age: entity.age,
    gender: entity.gender,
  );

  Map<String, dynamic> toMap() 
  {
    return {
      'chronicDiseases': chronicDiseases,
      'medicineTaken': medicineTaken,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
      'gender': gender,
    };
  }


}
