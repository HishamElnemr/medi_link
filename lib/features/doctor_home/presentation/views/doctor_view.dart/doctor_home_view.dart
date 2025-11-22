import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view.dart/widgets/doctor_home_view_body.dart';
import 'package:medi_link/features/patient_home/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorData = Prefs.getString(BackendEndpoints.kDoctorData);
    final doctorId = doctorData != null ? jsonDecode(doctorData)['id'] : '';
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
              ..getDoctorBookings(doctorId),
        child: const DoctorHomeViewBody(),
      ),
    );
  }
}
