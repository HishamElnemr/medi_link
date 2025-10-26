import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/custom_rounded_text_button.dart';
import 'package:medi_link/generated/l10n.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(27),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            S.of(context).logout,
            style: FontStyles.semiBold24.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).are_you_sure_to_logout,
            style: FontStyles.medium15.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRoundedTextButton(
                text: S.of(context).cancel,
                backgroundColor: AppColors.softBlue2,
                textColor: AppColors.primaryBlue,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 11),
              CustomRoundedTextButton(
                text: '${S.of(context).yes} , ${S.of(context).logout}',
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.white,
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    await Prefs.clear();
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.login,
                      );
                    }
                  } catch (e) {
                    log('Error during logout: $e');
                    if (context.mounted) {
                      buildSnackBar(
                        context,
                        S.of(context).log_out_failed,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
