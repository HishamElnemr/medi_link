import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/helper/get_doctor_data.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/widgets/cached_network_image_widget.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/app_bar_icon_button.dart';
import 'package:medi_link/generated/l10n.dart';

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
          CachedNetworkImageWidget(
            imageUrl: getDoctorData().imageUrl,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).welcome,
                  style: FontStyles.regular14.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
                Text(
                  S.of(context).dr + ' ' + getDoctorData().firstName,
                  style: FontStyles.medium15.copyWith(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          AppBarIconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.profileView);
            },
            icon: Icons.settings_outlined,
          ),
        ],
      ),
    );
  }
}
