import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/generated/l10n.dart';

class BookForAnotherPersonForm extends StatelessWidget {
  const BookForAnotherPersonForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.ageController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: firstNameController,
          hitText: S.of(context).first_name,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).this_field_is_required;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: lastNameController,
          hitText: S.of(context).last_name,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).this_field_is_required;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: ageController,
          hitText: S.of(context).age,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).invalid_age;
            }
            final age = int.tryParse(value);
            if (age == null || age <= 0 || age > 130) {
              return S.of(context).invalid_age;
            }
            return null;
          },
        ),
      ],
    );
  }
}
