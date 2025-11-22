import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medi_link/core/errors/failures.dart';
import 'package:medi_link/core/services/fire_store_services.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/data/models/doctor_model.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/auth/domain/repos/fire_store_repo.dart';

import '../../../../core/services/shared_preferences_singleton.dart';
import '../models/patient_model.dart';

class FireStoreRepoImpl implements FireStoreRepo {
  final FireStoreServices fireStoreServices;
  final _firestore = FirebaseFirestore.instance;

  FireStoreRepoImpl({required this.fireStoreServices});

  @override
  Future<Either<Failure, void>> addDoctorData(DoctorEntity doctorEntity) async {
    try {
      await fireStoreServices.addDoctorData(
        data: DoctorModel.fromEntity(doctorEntity).toJson(),
      );
      await saveDoctorData(doctorEntity);
      log('Doctor data saved successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error adding doctor data: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addPatientData(
    PatientEntity patientEntity,
  ) async {
    try {
      await fireStoreServices.addPatientData(
        data: PatientModel.fromEntity(patientEntity).toJson(),
      );
      await savePatientData(patientEntity);
      log('Patient data saved successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error adding patient data: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpecialization({
    required String specialization,
  }) async {
    try {
      var result = await fireStoreServices.getDoctorsBySpecialization(
        specialization: specialization,
      );
      return Right(
        result.map((e) => DoctorModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log('Error getting doctors by specialization: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      var result = await fireStoreServices.getDoctors();
      return Right(
        result.map((e) => DoctorModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log('Error getting doctors: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> getUserDataAndSaveRole(String uid) async {
    try {
      final doctorsQuery = await _firestore
          .collection(BackendEndpoints.doctorEndpoint)
          .where('id', isEqualTo: uid)
          .get();

      if (doctorsQuery.docs.isNotEmpty) {
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.doctorEndpoint,
        );
        var doctorData = doctorsQuery.docs.first.data();
        var doctorModel = DoctorModel.fromJson(doctorData);
        await saveDoctorData(doctorModel.toEntity());
        return;
      }

      final patientsQuery = await _firestore
          .collection(BackendEndpoints.patientsEndpoint)
          .where('id', isEqualTo: uid)
          .get();

      if (patientsQuery.docs.isNotEmpty) {
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.patientsEndpoint,
        );
        var patientData = patientsQuery.docs.first.data();
        var patientModel = PatientModel.fromJson(patientData);
        await savePatientData(patientModel.toEntity());
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future savePatientData(PatientEntity user) async {
    try {
      var patientModel = PatientModel.fromEntity(user);
      var mapData = patientModel.toMap();
      var jsonData = jsonEncode(mapData);
      await Prefs.setString(BackendEndpoints.kPatientData, jsonData);
    } catch (e) {
      rethrow;
    }
  }

  Future saveDoctorData(DoctorEntity user) async {
    try {
      var doctorModel = DoctorModel.fromEntity(user);
      var mapData = doctorModel.toMap();
      var jsonData = jsonEncode(mapData);
      await Prefs.setString(BackendEndpoints.kDoctorData, jsonData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, void>> updatePatientData(
    PatientEntity patientEntity,
    String uId,
  ) async {
    try {
      await fireStoreServices.updatePatientData(
        data: PatientModel.fromEntity(patientEntity).toJson(),
        uId: uId,
      );
      await savePatientData(patientEntity);
      log('Patient data updated successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error updating patient data: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDoctorData(
    DoctorEntity doctorEntity,
    String uId,
  ) async {
    try {
      await fireStoreServices.updateDoctorData(
        data: DoctorModel.fromEntity(doctorEntity).toJson(),
        uId: uId,
      );
      await saveDoctorData(doctorEntity);
      log('Doctor data updated successfully');
      return const Right(null);
    } on Exception catch (e) {
      log('Error updating doctor data: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
