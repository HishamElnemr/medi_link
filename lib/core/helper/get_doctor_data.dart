import 'dart:convert';

import '../../features/auth/data/models/doctor_model.dart';
import '../services/shared_preferences_singleton.dart';
import '../utils/backend_endpoints.dart';

getDoctorData() async {
  var data = await Prefs.getString(BackendEndpoints.kDoctorData);
  if (data == null || data.isEmpty) {
    throw Exception('No user data found');
  }
  var doctorData = DoctorModel.fromJson(jsonDecode(data));
  return doctorData;
}
