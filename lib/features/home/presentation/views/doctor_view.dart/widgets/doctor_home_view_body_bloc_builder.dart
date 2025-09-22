import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/booking_card_skeltonizer_loading_body.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/doctor_home_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorHomeViewBodyBlocBuilder extends StatelessWidget {
  const DoctorHomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is DoctorBookingsLoaded) {
          return DoctorHomeViewBody(patients: state.bookings);
        } else if (state is BookingError) {
          return Center(child: Text(state.failure.message));
        } else {
          return const Skeletonizer(child: BookingCardSkeltonizerLoadingBody());
        }
      },
    );
  }
}
