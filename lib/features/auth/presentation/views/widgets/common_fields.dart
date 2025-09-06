import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/core/widgets/password_field.dart';
import 'package:medi_link/generated/l10n.dart';

class CommonFields extends StatelessWidget {
  final void Function(String?) onEmailSaved;
  final void Function(String?) onPasswordSaved;

  const CommonFields({
    super.key,
    required this.onEmailSaved,
    required this.onPasswordSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hitText: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
          onSaved: onEmailSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).this_field_is_required;
            } else if (!RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            ).hasMatch(value)) {
              return S.of(context).email_is_not_valid;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        PasswordField(onSaved: onPasswordSaved),
      ],
    );
  }
}
