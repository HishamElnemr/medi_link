import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/widgets/custom_text_form_field.dart';
import 'package:medi_link/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.onSaved});
  final void Function(String?)? onSaved;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isObscure,
      hitText: S.of(context).password,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child:
            isObscure
                ?  const Icon(
                  Icons.visibility_outlined,
                  color: AppColors.darkGrey,
                )
                : const Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.darkGrey,
                ),
      ),
      onSaved: widget.onSaved,
    );
  }
}
