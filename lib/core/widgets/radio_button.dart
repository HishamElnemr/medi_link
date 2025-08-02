import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';

class CustomRadioGroup extends StatelessWidget {
  const CustomRadioGroup({
    super.key,
    required this.label,
    required this.options,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final List<RadioOption> options;
  final String groupValue;
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$label: ',
            style: FontStyles.medium15.copyWith(color: AppColors.primaryBlue),
          ),
          ..._buildOptions(),
        ],
      ),
    );
  }

  List<Widget> _buildOptions() {
    return options
        .map(
          (option) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Radio<String>(
                value: option.value,
                groupValue: groupValue,
                activeColor: AppColors.primaryBlue,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: onChanged,
              ),
              Text(
                option.label,
                style: FontStyles.medium15.copyWith(
                  color: groupValue == option.value
                      ? AppColors.primaryBlue
                      : AppColors.darkGrey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}

class RadioOption {
  final String value;
  final String label;

  const RadioOption({required this.value, required this.label});
}
