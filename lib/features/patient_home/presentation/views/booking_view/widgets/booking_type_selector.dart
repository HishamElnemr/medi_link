import 'package:flutter/material.dart';
import 'package:medi_link/features/patient_home/presentation/views/booking_view/widgets/select_patient.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingTypeSelector extends StatelessWidget {
  const BookingTypeSelector({
    super.key,
    required this.isMyselfSelected,
    required this.onSelectionChanged,
  });

  final bool isMyselfSelected;
  final ValueChanged<bool> onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SelectPatient(
          text: S.of(context).myself,
          onTap: () => onSelectionChanged(true),
          isSelected: isMyselfSelected,
        ),
        const SizedBox(width: 10),
        SelectPatient(
          text: S.of(context).other_person,
          onTap: () => onSelectionChanged(false),
          isSelected: !isMyselfSelected,
        ),
      ],
    );
  }
}
