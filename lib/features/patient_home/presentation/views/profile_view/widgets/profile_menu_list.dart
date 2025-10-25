import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/features/patient_home/data/models/profile_menu_item.dart';
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
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProfileListTile(
          item: profileMenuItems[index],
          onTap: () {
            profileMenuItems[index].route != null
                ? Navigator.pushNamed(context, profileMenuItems[index].route!)
                : null;
          },
        ),
        childCount: profileMenuItems.length,
      ),
    );
  }
}
