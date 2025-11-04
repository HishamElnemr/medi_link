import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/custom_icon.dart';

import '../../../../../../generated/l10n.dart';

class DoctorCardActions extends StatelessWidget {
  final VoidCallback onFavPressed;
  final void Function() onPressed;
  final bool isFavorite;

  const DoctorCardActions({
    super.key,
    required this.onFavPressed,
    required this.onPressed,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onFavPressed,
          child: CustomIcon(
            icon: isFavorite
                ? Assets.assetsImagesAddToFav
                : Assets.assetsImagesFav,
          ),
        ),
        const SizedBox(width: 5),
        const CustomIcon(icon: Assets.assetsImagesAbout),
        const Spacer(),
        CustomButton(
          onPressed: onPressed,
          text: S.of(context).book_appointment,
          width: 120,
          height: 40,
          style: FontStyles.medium15.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
