import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_sliver_list_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorsBySpecialityViewBody extends StatelessWidget {
  const DoctorsBySpecialityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).doctors),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: DoctorSliverListBlocBuilder(),
        ),
      ],
    );
  }
}
