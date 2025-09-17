import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/app_bar_icon_button.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:medi_link/language_cubit.dart';

import '../../../../../../core/helper/get_patient_data.dart';
import '../../../../../../core/routes/routes_name.dart';

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
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.softBlue2,
      elevation: 2.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.softBlue2,
        statusBarIconBrightness: Brightness.dark,
      ),
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
          AppBarIconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                await Prefs.clear();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                }
              } catch (e) {
                log('Error during logout: $e');
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Logout failed: $e')));
                }
              }
            },
            icon: Icons.logout,
          ),
          const SizedBox(width: 5),
          AppBarIconButton(
            onPressed: () {
              try {
                final languageCubit = context.read<LanguageCubit>();
                languageCubit.toggleLanguage();
                Prefs.setString(
                  BackendEndpoints.languageCode,
                  languageCubit.state.languageCode,
                );
              } catch (e) {
                log('Error changing language: $e');
              }
            },
            icon: Icons.translate_rounded,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
