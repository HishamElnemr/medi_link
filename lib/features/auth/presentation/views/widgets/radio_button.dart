import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key, required this.value, required this.onChanged});

  final String value;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.softBlue2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${S.of(context).sign_as}: ',
            style: FontStyles.medium15.copyWith(color: AppColors.primaryBlue),
          ),
          const SizedBox(width: 10),
          _buildRadioOption(context, 'Doctor', S.of(context).doctor),
          const SizedBox(width: 20),
          _buildRadioOption(context, 'Patient', S.of(context).patient),
        ],
      ),
    );
  }

  Widget _buildRadioOption(
    BuildContext context,
    String optionValue,
    String label,
  ) {
    return Row(
      children: [
        Radio<String>(
          value: optionValue,
          groupValue: value,
          activeColor: AppColors.primaryBlue,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: FontStyles.medium15.copyWith(
            color: value == optionValue
                ? AppColors.primaryBlue
                : AppColors.darkGrey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
