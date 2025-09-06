import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/core/widgets/radio_button.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/name_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/common_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/doctor_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/patient_fields.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/signup_submit.dart';
import 'package:medi_link/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey <FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email,
      password,
      firstName,
      lastName,
      specialization,
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
                onFirstNameSaved: (value) => firstName = value!,
                onLastNameSaved: (value) => lastName = value!,
              ),
              const SizedBox(height: 16),
              CommonFields(
                onEmailSaved: (value) => email = value!,
                onPasswordSaved: (value) => password = value!,
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
                  onSpecialityChanged: (value) => selectedSpeciality = value,
                  onSpecialitySaved: (value) => selectedSpeciality = value,
                  onAddressSaved: (value) => address = value!,
                  onPhoneNumberSaved: (value) =>
                      phoneNumber = int.parse(value!),
                ),
              ] else if (selectedType == 'Patient') ...[
                PatientFields(
                  onChronicDiseasesSaved: (value) => chronicDiseases = value!,
                  onMedicineTakenSaved: (value) => medicineTaken = value!,
                ),
              ],
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () => onSubmit(
                  context: context,
                  formKey: formKey,
                  email: email,
                  password: password,
                  firstName: firstName,
                  lastName: lastName,
                  age: age,
                  gender: selectedGender,
                  selectedType: selectedType,
                  speciality: selectedSpeciality,
                  address: address,
                  phoneNumber: phoneNumber,
                  chronicDiseases: chronicDiseases,
                  medicineTaken: medicineTaken,
                  onValidationFailed: () {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  },
                ),
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
}
