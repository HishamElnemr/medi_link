import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_doctor_data_cubit/add_doctor_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_patient_data_cubit/add_patient_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
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
  if (!formKey.currentState!.validate()) {
    onValidationFailed();
    return;
  }

  formKey.currentState!.save();

  try {
    // احفظ الـ Cubits في variables عشان متخدش context.read تاني بعد async
    final signupCubit = context.read<SignupCubit>();
    final addDoctorDataCubit = context.read<AddDoctorDataCubit>();
    final addPatientDataCubit = context.read<AddPatientDataCubit>();

    final userAuthEntity = await signupCubit.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: '$firstName $lastName',
      context: context,
      role: selectedType == 'Patient'
          ? BackendEndpoints.patientsEndpoint
          : BackendEndpoints.doctorEndpoint,
    );

    // تحقق من الـ mounted بعد العملية الـ async
    if (!context.mounted) return;

    if (userAuthEntity != null) {
      if (selectedType == 'Doctor') {
        // تحقق من الـ speciality قبل استخدامها
        if (speciality == null) {
          if (context.mounted) {
            buildSnackBar(context, 'Please select a speciality.');
          }
          return;
        }

        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.doctorEndpoint,
        );

        addDoctorDataCubit.addDoctorData(
          DoctorEntity(
            id: userAuthEntity.uId,
            speciality: speciality,
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
          _navigateWithDelay(
            context,
            RoutesName.doctorHome,
            S.of(context).account_created_successfully,
          );
        }
      } else if (selectedType == 'Patient') {
        await Prefs.setString(
          BackendEndpoints.getUserRole,
          BackendEndpoints.patientsEndpoint,
        );

        addPatientDataCubit.addPatientData(
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
          _navigateWithDelay(
            context,
            RoutesName.patientHome,
            S.of(context).account_created_successfully,
          );
        }
      }
    } else {
      // لو userAuthEntity null (فشل في الإنشاء)
      if (context.mounted) {
        buildSnackBar(context, 'Failed to create account. Please try again.');
      }
    }
  } catch (e) {
    // التعامل مع الأخطاء بأمان
    debugPrint('Error in onSubmit: $e');
    if (context.mounted) {
      buildSnackBar(context, 'Something went wrong. Please try again.');
    }
  }
}

// دالة منفصلة للـ navigation مع delay
void _navigateWithDelay(
  BuildContext context,
  String routeName,
  String message,
) {
  Future.delayed(const Duration(milliseconds: 500), () {
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, routeName);
      buildSnackBar(context, message);
    }
  });
}
