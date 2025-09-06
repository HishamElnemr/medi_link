import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/generated/l10n.dart';

class NameFields extends StatelessWidget {
  final void Function(String?) onFirstNameSaved;
  final void Function(String?) onLastNameSaved;

  const NameFields({
    super.key,
    required this.onFirstNameSaved,
    required this.onLastNameSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).first_name,
          keyboardType: TextInputType.text,
          onSaved: onFirstNameSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).last_name,
          keyboardType: TextInputType.text,
          onSaved: onLastNameSaved,
        ),
      ],
    );
  }
}
