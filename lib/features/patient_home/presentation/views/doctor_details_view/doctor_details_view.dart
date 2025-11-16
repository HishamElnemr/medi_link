import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/widgets/build_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/doctor_details_view/doctor_details_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).doctor_details,
        backgroundColor: AppColors.softBlue5,
      ),
      body: const DoctorDetailsViewBody(),
    );
  }
}
