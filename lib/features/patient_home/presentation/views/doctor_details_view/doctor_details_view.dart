import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/patient_home/data/repos/booking_repo_impl.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/widgets/doctor_details_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(bookingRepo: getIt<BookingRepoImpl>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: S.of(context).doctor_details,
          backgroundColor: AppColors.softBlue5,
        ),
        body: const DoctorDetailsViewBody(),
      ),
    );
  }
}
