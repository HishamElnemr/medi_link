import 'dart:convert';
import 'package:medi_link/features/auth/data/models/patient_model.dart';
import '../services/shared_preferences_singleton.dart';
import '../utils/backend_endpoints.dart';

getPatientData() {
  var data = Prefs.getString(BackendEndpoints.kPatientData);

  if (data == null || data.isEmpty) {
    throw Exception('No patient data found');
  }

  var patientData = PatientModel.fromJson(jsonDecode(data));
  return patientData;
}
