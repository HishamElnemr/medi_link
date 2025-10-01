import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/app_bar_icon_button.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:medi_link/language_cubit.dart';

class DoctorHomeAppBar extends StatelessWidget {
  const DoctorHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: false,
      expandedHeight: 60.0,
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
                  // TextSpan(
                  //   text: '${getDoctorData().firstName.toUpperCase()} ',
                  //   style: FontStyles.medium15.copyWith(
                  //     color: AppColors.darkGrey,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Spacer(),
          AppBarIconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, RoutesName.login);
            },
            icon: Icons.logout,
          ),
          const SizedBox(width: 5),
          AppBarIconButton(
            onPressed: () {
              final languageCubit = context.read<LanguageCubit>();
              languageCubit.toggleLanguage();
              Prefs.setString(
                BackendEndpoints.languageCode,
                languageCubit.state.languageCode,
              );
            },
            icon: Icons.translate_rounded,
          ),
        ],
      ),
    );
  }
}
