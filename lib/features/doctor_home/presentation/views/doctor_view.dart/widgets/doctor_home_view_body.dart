import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view.dart/widgets/doctor_home_view_body_bloc_builder.dart';
import 'package:medi_link/features/patient_home/domain/entities/booking_entity.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view.dart/widgets/doctor_home_app_bar.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view.dart/widgets/patients_list_view.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorHomeViewBody extends StatelessWidget {
  const DoctorHomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const DoctorHomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const DoctorHomeViewBodyBlocBuilder()
            ]),
          ),
        ),
      ],
    );
  }
}
