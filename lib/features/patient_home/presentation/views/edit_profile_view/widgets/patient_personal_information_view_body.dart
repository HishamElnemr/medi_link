import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/edit_profile_view/widgets/edit_patient_information_form_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class PatientPersonalInformationViewBody extends StatelessWidget {
  const PatientPersonalInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).personal_info, isVisible: true),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: EditPatientInformationFormBlocBuilder(),
        ),
      ],
    );
  }
}
