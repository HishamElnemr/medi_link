import 'package:dartz/dartz.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class FireStoreRepo {
  Future<Either<Failure, void>> addDoctorData(DoctorEntity doctorEntity);
  Future<Either<Failure, void>> addPatientData(PatientEntity patientEntity);

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpecialization({
    required String specialization,
  });

  Future<Either<Failure, List<DoctorEntity>>> getDoctors();

  Future<void> getUserDataAndSaveRole(String uid);

  Future<Either<Failure, void>> updatePatientData(
    PatientEntity patientEntity,
    String uId,
  );
  Future<Either<Failure, void>> updateDoctorData(
    DoctorEntity doctorEntity,
    String uId,
  );
}
