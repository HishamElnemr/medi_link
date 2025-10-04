import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_state.dart';
import 'package:medi_link/features/patient_home/presentation/views/booking_view/widgets/booking_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingViewBodyBlocConsumer extends StatelessWidget {
  const BookingViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          buildSnackBar(
            context,
            S.of(context).booking_successfully,
            color: Colors.green,
          );
          Navigator.pop(context, true);
        } else if (state is BookingError) {
          buildSnackBar(
            context,
            S.of(context).booking_failed,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return BookingViewBody(isLoading: state is BookingLoading);
      },
    );
  }
}
