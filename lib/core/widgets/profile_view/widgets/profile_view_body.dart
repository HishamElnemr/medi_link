import 'package:flutter/material.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/core/widgets/profile_view/widgets/profile_menu_list.dart';
import 'package:medi_link/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? userRole = Prefs.getString(BackendEndpoints.getUserRole);

    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: S.of(context).profile,
          isVisible: userRole == BackendEndpoints.patientsEndpoint
              ? false
              : true,
        ),
        const ProfileMenuList(),
      ],
    );
  }
}
