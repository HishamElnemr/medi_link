import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/core/utils/validators.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/features/auth/data/models/doctor_model.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/doctor_home/presentation/cubits/update_doctor_data/update_doctor_data_cubit.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_personal_information/widgets/edit_doctor_image.dart';
import 'package:medi_link/generated/l10n.dart';

class EditDoctorInformationForm extends StatefulWidget {
  const EditDoctorInformationForm({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<EditDoctorInformationForm> createState() =>
      _EditDoctorInformationFormState();
}

class _EditDoctorInformationFormState extends State<EditDoctorInformationForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController ageController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController addressController;
  late final TextEditingController sallaryController;
  late final TextEditingController yearsOfExperienceController;
  late final TextEditingController hospitalNameController;
  late final TextEditingController biographyController;
  File? fileImage;
  late final DoctorModel doctor;

  @override
  void initState() {
    super.initState();
    doctor = getDoctorData();

    firstNameController = TextEditingController(text: doctor.firstName);
    lastNameController = TextEditingController(text: doctor.lastName);
    emailController = TextEditingController(text: doctor.email);
    ageController = TextEditingController(text: doctor.age.toString());
    phoneNumberController = TextEditingController(
      text: doctor.phoneNumber.toString(),
    );
    addressController = TextEditingController(text: doctor.address);
    sallaryController = TextEditingController(text: doctor.sallary.toString());
    yearsOfExperienceController = TextEditingController(
      text: doctor.yearsOfExperience.toString(),
    );
    hospitalNameController = TextEditingController(text: doctor.hospitalName);
    biographyController = TextEditingController(text: doctor.biography);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    sallaryController.dispose();
    yearsOfExperienceController.dispose();
    hospitalNameController.dispose();
    biographyController.dispose();
    super.dispose();
  }

  void _updateData() {
    if (!_formKey.currentState!.validate()) return;

    final updatedDoctor = DoctorEntity(
      id: doctor.id,
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      age: int.tryParse(ageController.text.trim()) ?? doctor.age,
      gender: doctor.gender,
      phoneNumber:
          int.tryParse(phoneNumberController.text.trim()) ?? doctor.phoneNumber,
      address: addressController.text.trim(),
      sallary: int.tryParse(sallaryController.text.trim()) ?? doctor.sallary,
      yearsOfExperience:
          int.tryParse(yearsOfExperienceController.text.trim()) ??
          doctor.yearsOfExperience,
      hospitalName: hospitalNameController.text.trim(),
      biography: biographyController.text.trim(),
      speciality: doctor.speciality,
      image: (fileImage != null && fileImage!.path.isNotEmpty)
          ? fileImage!
          : (doctor.image),
      imageUrl: doctor.imageUrl,
    );

    context.read<UpdateDoctorDataCubit>().updateDoctorData(
      updatedDoctor,
      doctor.id,
    );
  }

  Widget _buildFieldWithLabel({required String label, required Widget field}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: FontStyles.medium20.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 8),
          field,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          EditDoctorImage(onFileChanged: (value) => fileImage = value),
          _buildFieldWithLabel(
            label: S.of(context).first_name,
            field: CustomTextFormField(
              hitText: S.of(context).first_name,
              keyboardType: TextInputType.text,
              controller: firstNameController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).last_name,
            field: CustomTextFormField(
              hitText: S.of(context).last_name,
              keyboardType: TextInputType.text,
              controller: lastNameController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).email,
            field: CustomTextFormField(
              hitText: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) => Validators.validateEmail(context, value),
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).age,
            field: CustomTextFormField(
              hitText: S.of(context).age,
              keyboardType: TextInputType.number,
              controller: ageController,
              validator: (value) => Validators.validateAge(context, value),
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).phone_number,
            field: CustomTextFormField(
              hitText: S.of(context).phone_number,
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).address,
            field: CustomTextFormField(
              hitText: S.of(context).address,
              keyboardType: TextInputType.text,
              controller: addressController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).salary,
            field: CustomTextFormField(
              hitText: S.of(context).salary,
              keyboardType: TextInputType.number,
              controller: sallaryController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).years_of_experience,
            field: CustomTextFormField(
              hitText: S.of(context).years_of_experience,
              keyboardType: TextInputType.number,
              controller: yearsOfExperienceController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).hospital_name,
            field: CustomTextFormField(
              hitText: S.of(context).hospital_name,
              keyboardType: TextInputType.text,
              controller: hospitalNameController,
            ),
          ),
          _buildFieldWithLabel(
            label: S.of(context).biography,
            field: CustomTextFormField(
              hitText: S.of(context).biography,
              keyboardType: TextInputType.multiline,
              controller: biographyController,
              maxLines: 5,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: CustomButton(
              onPressed: _updateData,
              text: S.of(context).upadte_profile,
              isLoading: widget.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
