import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/generated/l10n.dart';
import '../../../../../../core/helper/get_patient_data.dart';
import '../../../../../../core/routes/routes_name.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).welcome,
                  style: FontStyles.light12.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '${getPatientData().firstName.toUpperCase()}',
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: AppColors.softBlue1,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, RoutesName.login);
              },
              icon: SvgPicture.asset(
                Assets.assetsImagesSearch,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: AppColors.softBlue1,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.assetsImagesSetting,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
