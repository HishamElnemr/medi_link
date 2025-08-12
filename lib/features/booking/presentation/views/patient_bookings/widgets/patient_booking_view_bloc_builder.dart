import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_card.dart';
import 'package:medi_link/features/home/presentation/views/doctor_view.dart/widgets/skeltonizer_loading_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PatientBookingViewBlocBuilder extends StatelessWidget {
  const PatientBookingViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if(state is PatientBookingsLoaded)
        {
          return ListView.builder(
            itemCount: state.bookings.length,
            itemBuilder: (context, index) {
              return PatientBookingCard(booking: state.bookings[index]);
            },
          );
        }
        else if (state is BookingError) {
          return Center(child: Text(state.failure.message));
        } else {
          return const Skeletonizer(child: SkeltonizerLoadingBody());
        }
      },
    );
  }
}
