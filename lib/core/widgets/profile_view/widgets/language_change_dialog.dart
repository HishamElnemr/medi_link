import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:medi_link/language_cubit.dart';

class LanguageChangeDialog extends StatelessWidget {
  const LanguageChangeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).language,
        style: const TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      content: StatefulBuilder(
        builder: (context, setState) {
          final currentCode = context.read<LanguageCubit>().state.languageCode;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('English'),
                value: 'en',
                activeColor: AppColors.primaryBlue,
                groupValue: currentCode,
                onChanged: (value) {
                  if (value != null && value != currentCode) {
                    _changeLanguage(context, value);
                  }
                },
              ),
              RadioListTile<String>(
                title: const Text('العربية'),
                value: 'ar',
                activeColor: AppColors.primaryBlue,
                groupValue: currentCode,
                onChanged: (value) {
                  if (value != null && value != currentCode) {
                    _changeLanguage(context, value);
                  }
                },
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: AppColors.primaryBlue),
          child: Text(S.of(context).cancel),
        ),
      ],
    );
  }

  void _changeLanguage(BuildContext context, String code) {
    try {
      final languageCubit = context.read<LanguageCubit>();
      // Assuming toggleLanguage switches between en and ar
      languageCubit.toggleLanguage();
      Prefs.setString(
        BackendEndpoints.languageCode,
        languageCubit.state.languageCode,
      );
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      log('Error changing language: $e');
    }
  }
}
