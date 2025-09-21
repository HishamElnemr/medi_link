import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_view_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingView extends StatelessWidget {
  const PatientBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).bookings,
        backgroundColor: AppColors.softBlue1,
      ),
      body: const PatientBookingViewBlocBuilder(),
    );
  }
}
