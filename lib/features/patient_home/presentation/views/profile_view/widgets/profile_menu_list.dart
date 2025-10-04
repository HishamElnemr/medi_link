import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/features/patient_home/data/models/profile_menu_item.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/profile_list_tile.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileMenuItem> profileMenuItems = [
      const ProfileMenuItem(
        title: 'Profile',
        iconPath: Assets.assetsImagesProfileInctive,
      ),
      const ProfileMenuItem(
        title: 'Settings',
        iconPath: Assets.assetsImagesProfileInctive,
      ),
      const ProfileMenuItem(
        title: 'Help',
        iconPath: Assets.assetsImagesProfileInctive,
      ),
      const ProfileMenuItem(
        title: 'Privacy',
        iconPath: Assets.assetsImagesProfileInctive,
      ),
      const ProfileMenuItem(
        title: 'About',
        iconPath: Assets.assetsImagesProfileInctive,
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProfileListTile(
          item: profileMenuItems[index],
          onTap: () {},
        ),
        childCount: profileMenuItems.length,
      ),
    );
  }
}
