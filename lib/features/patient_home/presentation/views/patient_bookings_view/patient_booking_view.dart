import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/patient_home/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/patient_booking_view_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingView extends StatelessWidget {
  const PatientBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    final patientId = getPatientData().id;

    return BlocProvider(
      create: (_) =>
          BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
            ..getPatientBookings(patientId),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: S.of(context).bookings,
          isVisible: false,
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: PatientBookingViewBlocBuilder(),
        ),
      ),
    );
  }
}
