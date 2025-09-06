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
        ),
        const SizedBox(height: 16),
        PasswordField(onSaved: onPasswordSaved),
      ],
    );
  }
}
