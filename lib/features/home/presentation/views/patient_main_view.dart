import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/home/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/main_view_body.dart';

import 'patient_view/widgets/custom_buttom_nav_bar.dart';

class PatientMainView extends StatefulWidget {
  const PatientMainView({super.key});

  @override
  State<PatientMainView> createState() => _PatientMainViewState();
}

class _PatientMainViewState extends State<PatientMainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    final patientId = getPatientData().id;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
                ..getPatientBookings(patientId),
        ),
        BlocProvider(create: (context) => FavoriteCubit()),
      ],
      child: Scaffold(
        body: SafeArea(child: MainViewBody(currentViewIndex: currentViewIndex)),
        bottomNavigationBar: CustomButtomNavBar(
          selectedIndex: currentViewIndex,
          onItemTapped: (index) {
            setState(() {
              currentViewIndex = index;
            });
          },
        ),
      ),
    );
  }
}
