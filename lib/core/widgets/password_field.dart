import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
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
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          return S.of(context).this_field_is_required;
        } else if (value.length < 8) {
          return S.of(context).length_should_be_more_than_8;
        }
        return null;
      },
      obscureText: isObscure,
      hitText: S.of(context).password,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: isObscure
            ? const Icon(Icons.visibility_outlined, color: AppColors.darkGrey)
            : const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.darkGrey,
              ),
      ),
      onSaved: widget.onSaved,
    );
  }
}
