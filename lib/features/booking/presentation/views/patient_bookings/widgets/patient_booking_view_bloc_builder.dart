import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/card_skeltonizer_loading_body.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';
import 'package:medi_link/features/booking/presentation/views/patient_bookings/widgets/patient_booking_card.dart';
import 'package:medi_link/generated/l10n.dart';
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
          return const Skeletonizer(child: CardSkeltonizerLoadingBody());
        }
      },
    );
  }
}

class PatientBookingListView extends StatelessWidget {
  const PatientBookingListView({super.key, required this.bookings});
  final List<BookingEntity> bookings;

  @override
  Widget build(BuildContext context) {
    log('Bookings length: ${bookings.length}');
    if (bookings.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            S.of(context).no_appointment,
            style: const TextStyle(fontSize: 16, color: AppColors.primaryBlue),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return PatientBookingCard(booking: bookings[index]);
      },
    );
  }
}
