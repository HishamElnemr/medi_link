import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/auth/data/repos/fire_store_repo_imple.dart';
import 'package:medi_link/features/patient_home/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/get_doctors_by_speciality.dart/get_doctor_by_speciality_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/patient_home_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final patientId = getPatientData().id;
    return Scaffold(
      appBar: const PatientHomeAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetDoctorBySpecialityCubit(
              fireStoreRepoImpl: getIt<FireStoreRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (_) =>
                BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
                  ..getPatientBookings(patientId),
          ),
        ],
        child: const PatientHomeViewBody(),
      ),
    );
  }
}
