import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/home_app_bar.dart';

class DoctorHomeViewBody extends StatelessWidget {
  const DoctorHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(const [
              Text('DoctorHomeViewBody'),
            ]),
          ),
        ),
      ],
    );
  }
}
