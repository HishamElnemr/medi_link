import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_view_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingView extends StatelessWidget {
  const PatientBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    final patientData = Prefs.getString(BackendEndpoints.kPatientData);
    final patientId = patientData != null ? jsonDecode(patientData)['id'] : '';
    log('Patient ID: $patientId');
    return BlocProvider(
      create: (context) =>
          BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
            ..getPatientBookings(patientId),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: S.of(context).bookings,
          backgroundColor: AppColors.softBlue1,
        ),
        body: const PatientBookingViewBlocBuilder(),
      ),
    );
  }
}
