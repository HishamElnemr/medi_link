import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/upcoming_appointements_skeltonizer_loading_body.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_state.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/upcoming_appointments_list_view.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingAppointmentsListViewBuilder extends StatelessWidget {
  const UpcomingAppointmentsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is PatientBookingsLoaded) {
          return state.bookings.isEmpty
              ? Center(child: Text(S.of(context).no_appointment))
              : UpcomingAppointmentsListView(appointments: state.bookings);
        } else if (state is BookingError) {
          return Center(child: Text(state.failure.message));
        } else {
          return const Skeletonizer(
            containersColor: AppColors.softBlue5,
            child: UpcomingAppointementsSkeltonizerLoadingBody(),
          );
        }
      },
    );
  }
}
