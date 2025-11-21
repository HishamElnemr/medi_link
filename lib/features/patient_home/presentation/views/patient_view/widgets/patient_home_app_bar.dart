import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/app_bar_icon_button.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../../../../../core/helper/get_patient_data.dart';

class PatientHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PatientHomeAppBar({super.key});

  String _getPatientName(BuildContext context) {
    try {
      final patientData = getPatientData();
      return patientData?.firstName.toUpperCase() ?? 'USER';
    } catch (e) {
      log('Error getting patient data: $e');
      return 'USER';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.softBlue5,
      elevation: 2.0,
      title: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).welcome + ' ',
                    style: FontStyles.light12.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: _getPatientName(context),
                    style: FontStyles.light12.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Spacer(),
          AppBarIconButton(onPressed: () {}, icon: Icons.settings_sharp),
          const SizedBox(width: 15),
          AppBarIconButton(onPressed: () {}, icon: Icons.notifications),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
