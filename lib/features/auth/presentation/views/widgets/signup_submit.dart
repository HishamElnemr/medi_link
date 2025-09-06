import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_doctor_data_cubit/add_doctor_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_patient_data_cubit/add_patient_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';

void onSubmit({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String email,
  required String password,
  required String firstName,
  required String lastName,
  required int age,
  required String gender,
  required String selectedType,
  required String? speciality,
  required String address,
  required int phoneNumber,
  required String chronicDiseases,
  required String medicineTaken,
  required VoidCallback onValidationFailed,
}) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    final userAuthEntity = await context
        .read<SignupCubit>()
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
          name: '$firstName $lastName',
          context: context,
        );
    if (userAuthEntity != null) {
      if (selectedType == 'Doctor') {
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.doctorEndpoint,
        );
        context.read<AddDoctorDataCubit>().addDoctorData(
          DoctorEntity(
            id: userAuthEntity.uId,
            speciality: speciality!,
            firstName: firstName,
            lastName: lastName,
            email: email,
            age: age,
            gender: gender,
            phoneNumber: phoneNumber,
            address: address,
          ),
        );
        if (context.mounted) {
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(context, RoutesName.doctorHome);
            buildSnackBar(context, S.of(context).account_created_successfully);
          });
        }
      }
      if (selectedType == 'Patient') {
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.patientsEndpoint,
        );
        context.read<AddPatientDataCubit>().addPatientData(
          PatientEntity(
            id: userAuthEntity.uId,
            firstName: firstName,
            lastName: lastName,
            email: email,
            age: age,
            gender: gender,
            chronicDiseases: chronicDiseases,
            medicineTaken: medicineTaken,
          ),
        );
        if (context.mounted) {
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(context, RoutesName.patientHome);
            buildSnackBar(context, S.of(context).account_created_successfully);
          });
        }
      }
    }
  } else {
    onValidationFailed();
  }
}
