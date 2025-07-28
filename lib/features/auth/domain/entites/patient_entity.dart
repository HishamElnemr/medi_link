import 'package:medi_link/core/models/user_entity.dart';

class PatientEntity extends UserEntity {
  final String? chronicDiseases;
  final String? medicineTaken;
  PatientEntity({
    this.chronicDiseases,
    this.medicineTaken,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.age,
    required super.gender,
  });
}
