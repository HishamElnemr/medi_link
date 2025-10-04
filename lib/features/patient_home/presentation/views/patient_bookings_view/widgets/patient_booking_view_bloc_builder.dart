import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/utils/booking_card_skeltonizer_loading_body.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_state.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_bookings_view/widgets/patient_booking_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PatientBookingViewBlocBuilder extends StatelessWidget {
  const PatientBookingViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is PatientBookingsLoaded) {
          return PatientBookingListView(bookings: state.bookings);
        } else if (state is BookingError) {
          return Center(child: Text(state.failure.message));
        } else {
          return const Skeletonizer(child: BookingCardSkeltonizerLoadingBody());
        }
      },
    );
  }
}
