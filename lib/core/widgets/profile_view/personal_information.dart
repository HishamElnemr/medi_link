import 'package:flutter/material.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_personal_information/doctor_personal_information.dart';
import 'package:medi_link/features/patient_home/presentation/views/edit_profile_view/patient_personal_information.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    String? userRole = Prefs.getString(BackendEndpoints.getUserRole);
    return userRole == BackendEndpoints.patientsEndpoint
        ? const PatientPersonalInformation()
        : const DoctorPersonalInformation();
  }
}
