import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/profile_view/widgets/profile_list_tile.dart';
import 'package:medi_link/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).profile, isVisible: false),
        SliverList(
          delegate: SliverChildListDelegate([
            ProfileListTile(
              text: S.of(context).profile,
              assetIconPath: Assets.assetsImagesProfileInctive,
              onTap: () {},
            ),
          ]),
        ),
      ],
    );
  }
}
