import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view/widgets/doctor_home_app_bar.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_view/widgets/doctor_home_view_body_bloc_builder.dart';

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
              const DoctorHomeViewBodyBlocBuilder(),
            ]),
          ),
        ),
      ],
    );
  }
}
