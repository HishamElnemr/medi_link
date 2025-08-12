

import 'package:flutter/material.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/patient_booking_view.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/patient_home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        PatientHomeView(),
        PatientBookingView(),
      ],
    );
  }
}
