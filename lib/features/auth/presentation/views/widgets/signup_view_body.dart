import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/widgets/custom_button.dart';
import 'package:medi_link/core/utils/widgets/custom_text_form_field.dart';
import 'package:medi_link/core/utils/widgets/password_field.dart';
import 'package:medi_link/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/radio_button.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/speciality_dropdown%20.dart';
import 'package:medi_link/generated/l10n.dart';

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
      specialization,
      chronicDiseases,
      medicineTaken;
  late String doctorAge, patientAge;
  late bool isTermsAccepted = false;
  String selectedType = 'Patient';
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
              RadioButton(
                value: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              buildNameFields(),
              const SizedBox(height: 16),
              buildCommonFields(),
              const SizedBox(height: 16),
              if (selectedType == 'Doctor') ...[
                buildDoctorFields(),
              ] else if (selectedType == 'Patient') ...[
                buildPatientFields(),
              ],
              const SizedBox(height: 30),
              CustomButton(
                onPressed: onSubmit,
                text: S.of(context).create_new_account,
              ),
              const SizedBox(height: 16),
              const HaveAnAccount(),
              if (selectedType == 'Patient') ...[const SizedBox(height: 35)],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameFields() {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).first_name,
          keyboardType: TextInputType.name,
          onSaved: (value) => firstName = value!,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).last_name,
          keyboardType: TextInputType.name,
          onSaved: (value) => lastName = value!,
        ),
      ],
    );
  }

  Widget buildCommonFields() {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) => email = value!,
        ),
        const SizedBox(height: 16),
        PasswordField(onSaved: (value) => password = value!),
      ],
    );
  }

  Widget buildDoctorFields() {
    return Column(
      children: [
        SpecialityDropdown(
          selectedKey: selectedSpeciality,
          onChanged: (value) {
            selectedSpeciality = value;
          },
          onSaved: (value) {
            selectedSpeciality = value;
          },
        ),

        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).age,
          keyboardType: TextInputType.number,
          onSaved: (value) => doctorAge = value!,
        ),
      ],
    );
  }

  Widget buildPatientFields() {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).age,
          keyboardType: TextInputType.number,
          onSaved: (value) => patientAge = value!,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).chronic_diseases,
          keyboardType: TextInputType.text,
          maxLines: 3,
          isRequired: false,
          onSaved: (value) => chronicDiseases = value!,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).medicine_taken,
          keyboardType: TextInputType.text,
          isRequired: false,
          maxLines: 3,
          onSaved: (value) => medicineTaken = value!,
        ),
      ],
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<SignupCubit>().createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: '$firstName $lastName',
        context: context,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
