import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/utils/validators.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/features/auth/data/models/patient_model.dart';
import 'package:medi_link/features/auth/domain/entites/patient_entity.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/update_patient_data/update_patient_data_cubit.dart';
import 'package:medi_link/generated/l10n.dart';

class EditPatientInformationForm extends StatefulWidget {
  const EditPatientInformationForm({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<EditPatientInformationForm> createState() =>
      _EditPatientInformationFormState();
}

class _EditPatientInformationFormState
    extends State<EditPatientInformationForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController ageController;

  late final PatientModel patient;

  @override
  void initState() {
    super.initState();
    patient = getPatientData();

    firstNameController = TextEditingController(text: patient.firstName);
    lastNameController = TextEditingController(text: patient.lastName);
    emailController = TextEditingController(text: patient.email);
    ageController = TextEditingController(text: patient.age.toString());
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _updateData() {
    if (!_formKey.currentState!.validate()) return;

    final updatedPatient = PatientEntity(
      id: patient.id,
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      age: int.tryParse(ageController.text.trim()) ?? patient.age,
      gender: patient.gender,
      chronicDiseases: patient.chronicDiseases,
      medicineTaken: patient.medicineTaken,
    );

    context.read<UpdatePatientDataCubit>().updatePatientData(
      updatedPatient,
      patient.id,
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
