import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_about_and_booking.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_details_card.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DoctorEntity;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            DoctorDetailsCard(args: args),
            const SizedBox(height: 30),
            DoctorAboutAndBooking(args: args),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
