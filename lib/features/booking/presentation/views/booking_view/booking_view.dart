import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/booking/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/booking/presentation/views/booking_view/widgets/booking_view_body_bloc_listener.dart';
import 'package:medi_link/generated/l10n.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(bookingRepo: getIt<BookingRepoImpl>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: S.of(context).complete_the_appointment,
        ),
        body: const BookingViewBodyBlocListener(),
      ),
    );
  }
}
