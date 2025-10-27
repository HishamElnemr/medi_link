import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/features/patient_home/data/models/profile_menu_item.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/language_change_dialog.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/logout_confirmation_dialog.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/profile_list_tile.dart';
import 'package:medi_link/generated/l10n.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileMenuItem> profileMenuItems = [
      ProfileMenuItem(
        title: S.of(context).personal_info,
        iconPath: Assets.assetsImagesProfileInctive,
        route: RoutesName.personalInformation,
      ),
      ProfileMenuItem(
        title: S.of(context).settings,
        iconPath: Assets.assetsImagesSetting,
      ),
      ProfileMenuItem(
        title: S.of(context).payment_method,
        iconPath: Assets.assetsImagesPayment,
      ),
      ProfileMenuItem(
        title: S.of(context).help,
        iconPath: Assets.assetsImagesAbout,
      ),
      ProfileMenuItem(
        title: S.of(context).privacy_policy,
        iconPath: Assets.assetsImagesPrivacy,
      ),
      ProfileMenuItem(
        title: S.of(context).logout,
        iconPath: Assets.assetsImagesLogout,
        action: 'logout',
      ),
      ProfileMenuItem(
        title: S.of(context).language,
        iconPath: Assets.assetsImagesLanguageSolidFull,
        action: 'language',
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProfileListTile(
          item: profileMenuItems[index],
          onTap: () {
            final item = profileMenuItems[index];
            if (item.route != null) {
              Navigator.pushNamed(context, item.route!);
            }
            if (item.action != null) {
              switch (item.action!) {
                case 'logout':
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: false,
                    barrierColor: AppColors.primaryBlue.withOpacity(.54),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder: (context) => const LogoutConfirmationDialog(),
                  );
                  break;
                case 'language':
                  showDialog(
                    context: context,
                    barrierColor: AppColors.primaryBlue.withOpacity(.54),
                    builder: (context) => const LanguageChangeDialog(),
                  );
                  break;
              }
            }
          },
        ),
        childCount: profileMenuItems.length,
      ),
    );
  }
}
