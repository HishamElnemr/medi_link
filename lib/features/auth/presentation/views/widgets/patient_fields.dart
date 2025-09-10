import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientFields extends StatelessWidget {
  final void Function(String?) onChronicSaved;
  final void Function(String?) onMedicineSaved;

  const PatientFields({
    super.key,
    required this.onChronicSaved,
    required this.onMedicineSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).chronic_diseases,
          keyboardType: TextInputType.text,
          maxLines: 3,
          isRequired: false,
          onSaved: onChronicSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).medicine_taken,
          keyboardType: TextInputType.text,
          isRequired: false,
          maxLines: 3,
          onSaved: onMedicineSaved,
        ),
      ],
    );
  }
}
