import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_text_form_field.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/speciality_dropdown.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorFields extends StatelessWidget {
  final void Function(String?) onSpecialityChanged;
  final void Function(String?) onSpecialitySaved;
  final void Function(String?) onAddressSaved;
  final void Function(String?) onPhoneNumberSaved;

  const DoctorFields({
    super.key,
    required this.onSpecialityChanged,
    required this.onSpecialitySaved,
    required this.onAddressSaved,
    required this.onPhoneNumberSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpecialityDropdown(
          selectedKey: null,
          onChanged: onSpecialityChanged,
          onSaved: onSpecialitySaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).address,
          keyboardType: TextInputType.text,
          maxLines: 2,
          onSaved: onAddressSaved,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hitText: S.of(context).phone_number,
          keyboardType: TextInputType.number,
          validator: (p0) {
            if ((p0 == null || p0.isEmpty)) {
              return S.of(context).this_field_is_required;
            } else if (p0.length != 11) {
              return S.of(context).invalid_phone_number;
            }
            return null;
          },
          onSaved: onPhoneNumberSaved,
        ),
      ],
    );
  }
}
