import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
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

  static const List<String> specialtyKeys = [
    'internal_medicine',
    'surgery',
    'pediatrics',
    'gynecology',
    'orthopedics',
    'dermatology',
    'ophthalmology',
    'cardiology',
    'neurology',
    'psychiatry',
    'dentistry',
    'ent',
    'urology',
    'nephrology',
    'oncology',
    'radiology',
    'anesthesia',
    'icu',
    'emergency',
    'endocrinology',
    'rheumatology',
    'gastroenterology',
    'pulmonology',
  ];

  String translateKey(BuildContext context, String key) {
    final s = S.of(context);
    final map = {
      'internal_medicine': s.internal_medicine,
      'surgery': s.surgery,
      'pediatrics': s.pediatrics,
      'gynecology': s.gynecology,
      'orthopedics': s.orthopedics,
      'dermatology': s.dermatology,
      'ophthalmology': s.ophthalmology,
      'cardiology': s.cardiology,
      'neurology': s.neurology,
      'psychiatry': s.psychiatry,
      'dentistry': s.dentistry,
      'ent': s.ent,
      'liver': s.liver,
      'urology': s.urology,
      'nephrology': s.nephrology,
      'oncology': s.oncology,
      'radiology': s.radiology,
      'anesthesia': s.anesthesia,
      'icu': s.icu,
      'emergency': s.emergency,
      'endocrinology': s.endocrinology,
      'rheumatology': s.rheumatology,
      'gastroenterology': s.gastroenterology,
      'pulmonology': s.pulmonology,
    };
    return map[key] ?? '';
  }

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
      items: specialtyKeys
          .map(
            (key) => DropdownMenuItem<String>(
              value: key,
              child: Text(translateKey(context, key)),
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
