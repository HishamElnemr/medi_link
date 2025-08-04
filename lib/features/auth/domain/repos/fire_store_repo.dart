import 'package:dartz/dartz.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class FireStoreRepo {
  Future<Either<Failure, void>> addDoctorData(DoctorEntity doctorEntity);
  Future<Either<Failure, void>> addPatientData(PatientEntity patientEntity);

  Future<Either<Failure, List<DoctorEntity>>> getAllDoctors();

  Future<void> getUserDataAndSaveRole(String uid);
  //Future<Either<Failure, List<PatientEntity>>> getAllPatients();
  //Future<Either<Failure, void>> updateDoctorData(DoctorEntity doctorEntity);
  //Future<Either<Failure, void>> updatePatientData(PatientEntity patientEntity);
}
