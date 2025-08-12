import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/doctor_home_view_body_bloc_builder.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorId = getDoctorData().id;
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BookingCubit(bookingRepo: getIt<BookingRepoImpl>())
              ..getDoctorBookings(doctorId),
        child: const DoctorHomeViewBodyBlocBuilder(),
      ),
    );
  }
}
