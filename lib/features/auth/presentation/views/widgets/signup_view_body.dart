// lib/features/auth/presentation/views/widgets/signup_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_doctor_data_cubit/add_doctor_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/add_patient_data_cubit/add_patient_data_cubit.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/common_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/doctor_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/name_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/patient_fields.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/radio_button.dart';
import 'have_an_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email,
      password,
      firstName,
      lastName,
      chronicDiseases,
      address,
      medicineTaken;
  late int age, phoneNumber;
  String selectedType = 'Patient';
  String selectedGender = 'Male';
  String? selectedSpeciality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 30),
              CustomRadioGroup(
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
                label: S.of(context).sign_as,
                options: [
                  RadioOption(label: S.of(context).patient, value: 'Patient'),
                  RadioOption(label: S.of(context).doctor, value: 'Doctor'),
                ],
                groupValue: selectedType,
              ),
              const SizedBox(height: 16),
              NameFields(
                onFirstNameSaved: (v) => firstName = v ?? '',
                onLastNameSaved: (v) => lastName = v ?? '',
              ),
              const SizedBox(height: 16),
              CommonFields(
                onEmailSaved: (v) => email = v ?? '',
                onPasswordSaved: (v) => password = v ?? '',
              ),
              const SizedBox(height: 16),
              CustomRadioGroup(
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                label: S.of(context).gender,
                options: [
                  RadioOption(label: S.of(context).male, value: 'Male'),
                  RadioOption(label: S.of(context).female, value: 'Female'),
                ],
                groupValue: selectedGender,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hitText: S.of(context).age,
                keyboardType: TextInputType.number,
                validator: (p0) {
                  if ((p0 == null || p0.isEmpty)) {
                    return S.of(context).this_field_is_required;
                  } else if (int.parse(p0) > 120 || int.parse(p0) < 0) {
                    return S.of(context).invalid_age;
                  }
                  return null;
                },
                onSaved: (value) => age = int.parse(value!),
              ),
              const SizedBox(height: 16),
              if (selectedType == 'Doctor') ...[
                DoctorFields(
                  selectedSpeciality: selectedSpeciality,
                  onSpecialityChanged: (v) => selectedSpeciality = v,
                  onSpecialitySaved: (v) => selectedSpeciality = v,
                  onAddressSaved: (v) => address = v ?? '',
                  onPhoneSaved: (v) => phoneNumber = int.parse(v ?? '0'),
                ),
              ] else if (selectedType == 'Patient') ...[
                PatientFields(
                  onChronicSaved: (v) => chronicDiseases = v ?? '',
                  onMedicineSaved: (v) => medicineTaken = v ?? '',
                ),
              ],
              const SizedBox(height: 30),
              CustomButton(
                onPressed: onSubmit,
                text: S.of(context).create_new_account,
              ),
              const SizedBox(height: 16),
              const HaveAnAccount(),
              if (selectedType == 'Patient') ...[const SizedBox(height: 35)],
              SizedBox(height: selectedType == 'Patient' ? 0 : 35),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() async {
    if (!formKey.currentState!.validate()) {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
      return;
    }

    formKey.currentState!.save();

    final signupCubit = context.read<SignupCubit>();
    final patientCubit = context.read<AddPatientDataCubit>();
    final doctorCubit = context.read<AddDoctorDataCubit>();

    final role = selectedType == 'Doctor'
        ? BackendEndpoints.doctorEndpoint
        : BackendEndpoints.patientsEndpoint;

    await Prefs.setString(BackendEndpoints.getUserRole, role);

    final user = await signupCubit.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: '$firstName $lastName',
      role: role,
      context: context,
    );

    if (user != null) {
      if (role == BackendEndpoints.patientsEndpoint) {
        final patient = PatientEntity(
          id: user.uId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          age: age,
          gender: selectedGender,
          chronicDiseases: chronicDiseases,
          medicineTaken: medicineTaken,
        );
        patientCubit.addPatientData(patient);
      } else if (role == BackendEndpoints.doctorEndpoint) {
        final doctor = DoctorEntity(
          id: user.uId,
          speciality: selectedSpeciality ?? '',
          firstName: firstName,
          lastName: lastName,
          email: email,
          age: age,
          gender: selectedGender,
          phoneNumber: phoneNumber,
          address: address,
        );
        doctorCubit.addDoctorData(doctor);
      }
    }
  }
}
