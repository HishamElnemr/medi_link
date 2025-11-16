import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/image_field.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/speciality_dropdown.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorFields extends StatelessWidget {
  final String? selectedSpeciality;
  final void Function(String?) onSpecialityChanged;
  final void Function(String?) onSpecialitySaved;
  final void Function(String?) onAddressSaved;
  final void Function(String?) onPhoneSaved;
  final void Function(String?) onSalarySaved;
  final void Function(String?) onYearsOfExperienceSaved;
  final void Function(String?) onHospitalNameSaved;
  final void Function(String?) onDoctorBiographySaved;
  final void Function(File?)? onFileChanged;
  const DoctorFields({
    super.key,
    required this.selectedSpeciality,
    required this.onSpecialityChanged,
    required this.onSpecialitySaved,
    required this.onAddressSaved,
    required this.onPhoneSaved,
    required this.onSalarySaved,
    required this.onYearsOfExperienceSaved,
    required this.onHospitalNameSaved,
    required this.onFileChanged,
    required this.onDoctorBiographySaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpecialityDropdown(
          selectedKey: selectedSpeciality,
          onChanged: onSpecialityChanged,
          onSaved: onSpecialitySaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).phone_number,
          keyboardType: TextInputType.number,
          onSaved: onPhoneSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).address,
          keyboardType: TextInputType.text,
          maxLines: 2,
          onSaved: onAddressSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).salary,
          keyboardType: TextInputType.number,
          onSaved: onSalarySaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).years_of_experience,
          keyboardType: TextInputType.number,
          onSaved: onYearsOfExperienceSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).hospital_name,
          keyboardType: TextInputType.text,
          onSaved: onHospitalNameSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).biography,
          keyboardType: TextInputType.text,
          maxLines: 20,
          minLines: 7,
          onSaved: onDoctorBiographySaved,
        ),
        const SizedBox(height: 16),
        ImageField(onFileChanged: onFileChanged),
      ],
    );
  }
}
