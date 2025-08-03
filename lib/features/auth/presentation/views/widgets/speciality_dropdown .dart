import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/specialty_utils.dart';
import 'package:medi_link/generated/l10n.dart';

class SpecialityDropdown extends StatelessWidget {
  final String? selectedKey;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  const SpecialityDropdown({
    super.key,
    required this.selectedKey,
    required this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedKey,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).specialization;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.softBlue2,
        hint: Text(
          S.of(context).specialization,
          style: FontStyles.medium15.copyWith(color: AppColors.softBlue3),
        ),
        hintStyle: FontStyles.medium15.copyWith(color: AppColors.softBlue3),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
      ),
      items: SpecialtyUtils.specialtyKeys
          .map(
            (key) => DropdownMenuItem<String>(
              value: key,
              child: Text(SpecialtyUtils.getLocalizedSpecialty(context, key)),
            ),
          )
          .toList(),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: AppColors.softBlue1),
    );
  }
}
