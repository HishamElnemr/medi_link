

import 'package:flutter/material.dart';
import 'package:medi_link/features/patient_home/presentation/views/favorite_view/favorite_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/patient_booking_view.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/patient_home_view.dart';

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
        FavoriteView(),
      ],
    );
  }
}
