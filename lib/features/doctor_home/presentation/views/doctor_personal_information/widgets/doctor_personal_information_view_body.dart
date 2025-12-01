import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/doctor_home/presentation/views/doctor_personal_information/widgets/edit_doctor_information_form_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorPersonalInformationViewBody extends StatelessWidget {
  const DoctorPersonalInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).personal_info, isVisible: true),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: EditDoctorInformationFormBlocBuilder(),
        ),
      ],
    );
  }
}
