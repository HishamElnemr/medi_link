import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_view_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientBookingView extends StatefulWidget {
  const PatientBookingView({super.key});

  @override
  State<PatientBookingView> createState() => _PatientBookingViewState();
}

class _PatientBookingViewState extends State<PatientBookingView> {
  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    final patientData = getPatientData();
    if (patientData.id != null) {
      context.read<BookingCubit>().getPatientBookings(patientData.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).bookings,
        backgroundColor: AppColors.softBlue2,
        isVisible: false,
      ),
      body: RefreshIndicator(
        color: AppColors.primaryBlue,
        onRefresh: () async {
          _loadBookings();
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: PatientBookingViewBlocBuilder(),
        ),
      ),
    );
  }
}
