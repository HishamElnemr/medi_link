import 'package:flutter/material.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/booking_details.dart';
import 'package:medi_link/generated/l10n.dart';

class BookForMeDetails extends StatelessWidget {
  const BookForMeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final patientData = getPatientData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingDetails(
          title: S.of(context).full_name,
          value: '${patientData.firstName} ${patientData.lastName}',
        ),
        const SizedBox(height: 16),
        BookingDetails(
          title: S.of(context).age,
          value: patientData.age.toString(),
        ),
        const SizedBox(height: 16),
        BookingDetails(title: S.of(context).email, value: patientData.email),
      ],
    );
  }
}
