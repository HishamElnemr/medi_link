import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_state.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/booking_view_body.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookingViewBodyBlocListener extends StatelessWidget {
  const BookingViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
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
        } else {
          const Skeletonizer(child: BookingViewBody());
        }
      },
      child: const BookingViewBody(),
    );
  }
}
