import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Prefs.getString(BackendEndpoints.getUserName);
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: S.of(context).welcome,
                style: FontStyles.light12.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
              TextSpan(
                text: ' $name',
                style: FontStyles.medium15.copyWith(color: AppColors.darkGrey),
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
            onPressed: () {},
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
    );
  }
}
