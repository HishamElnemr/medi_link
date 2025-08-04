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
  Future<Either<Failure, List<DoctorEntity>>> getAllDoctors() async {
    try {
      var result = await fireStoreServices.getAllDoctors();
      return Right(
        result.map((e) => DoctorModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log('Error getting all doctors: $e');
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<void> getUserDataAndSaveRole(String uid) async {
    try {
      log('Getting user data for UID: $uid');

      final doctorsQuery = await _firestore
          .collection(BackendEndpoints.doctorEndpoint)
          .where('id', isEqualTo: uid)
          .get();

      if (doctorsQuery.docs.isNotEmpty) {
        log('User found as doctor');
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.doctorEndpoint,
        );

        var doctorData = doctorsQuery.docs.first.data();
        log('Doctor data saved: $doctorData');
        log('Doctor data from Firestore: $doctorData');
        var doctorModel = DoctorModel.fromJson(doctorData);
        await saveDoctorData(doctorModel.toEntity());
        log('Doctor data saved successfully');
        return;
      }

      final patientsQuery = await _firestore
          .collection(BackendEndpoints.patientsEndpoint)
          .where('id', isEqualTo: uid)
          .get();

      if (patientsQuery.docs.isNotEmpty) {
        log('User found as patient');
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.patientsEndpoint,
        );

        var patientData = patientsQuery.docs.first.data();
        log('Patient data from Firestore: $patientData');
        var patientModel = PatientModel.fromJson(patientData);
        await savePatientData(patientModel.toEntity());
        log('Patient data saved successfully');
        return;
      }

      log('User not found in any collection');
    } catch (e) {
      log('Error in getUserDataAndSaveRole: $e');
      rethrow;
    }
  }
}

Future savePatientData(PatientEntity user) async {
  try {
    var jsonData = jsonEncode(PatientModel.fromEntity(user).toMap());
    await Prefs.setString(BackendEndpoints.kPatientData, jsonData);
    log('Patient data saved to SharedPreferences');
  } catch (e) {
    log('Error saving patient data: $e');
    rethrow;
  }
}

Future saveDoctorData(DoctorEntity user) async {
  try {
    var jsonData = jsonEncode(DoctorModel.fromEntity(user).toMap());
    await Prefs.setString(BackendEndpoints.kDoctorData, jsonData);
    log('Doctor data saved to SharedPreferences');
  } catch (e) {
    log('Error saving doctor data: $e');
    rethrow;
  }
}
