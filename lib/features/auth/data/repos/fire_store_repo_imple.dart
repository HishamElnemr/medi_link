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
      saveDoctorData(doctorEntity);
      return const Right(null);
    } on Exception catch (e) {
      log(e.toString());
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
      savePatientData(patientEntity);
      return const Right(null);
    } on Exception catch (e) {
      log(e.toString());
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
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PatientEntity>>> getAllPatients() async {
    try {
      var result = await fireStoreServices.getAllPatients();
      return Right(
        result.map((e) => PatientModel.fromJson(e).toEntity()).toList(),
      );
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> getUserDataAndSaveRole(String uid) async {
    final doctorsQuery = await _firestore
        .collection(BackendEndpoints.doctorEndpoint)
        .where('id', isEqualTo: uid)
        .get();

    if (doctorsQuery.docs.isNotEmpty) {
      await Prefs.setString(
        BackendEndpoints.getUserRole,
        BackendEndpoints.doctorEndpoint,
      );
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
      return;
    }
  }
}

Future savePatientData(PatientEntity user) async {
  var jsonData = jsonEncode(PatientModel.fromEntity(user).toMap());
  await Prefs.setString(BackendEndpoints.kPatientData, jsonData);
}

Future saveDoctorData(DoctorEntity user) async {
  var jsonData = jsonEncode(DoctorModel.fromEntity(user).toMap());
  await Prefs.setString(BackendEndpoints.kDoctorData, jsonData);
}
