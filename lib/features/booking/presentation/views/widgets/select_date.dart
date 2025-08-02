import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class SelectDate extends StatefulWidget {
  final Function(DateTime?)? onDateSelected;
  final DateTime? initialDate; 

  const SelectDate({super.key, this.onDateSelected, this.initialDate});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate; 
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && mounted) {
      setState(() {
        selectedDate = picked; 
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(selectedDate); 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).select_date,
          style: FontStyles.medium15.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => _selectDate(context),
          child: Text(
            selectedDate == null
                ? S.of(context).click_to_select_date
                : '${selectedDate!.toLocal().toString().split(' ')[0]}',
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}