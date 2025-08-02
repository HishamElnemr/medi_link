import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hitText,
    required this.keyboardType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.isRequired = true,
    this.maxLines = 1,
    this.validator,
    this.controller,
  });
  final TextEditingController? controller;
  final String hitText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool isRequired;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator:
          validator ??
          (value) {
            if ((value == null || value.isEmpty) && isRequired) {
              return S.of(context).this_field_is_required;
            }
            return null;
          },
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hitText,
        hintStyle: FontStyles.medium15.copyWith(color: AppColors.softBlue3),
        filled: true,
        fillColor: AppColors.softBlue2,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: AppColors.softBlue1, width: 1),
    );
  }
}
