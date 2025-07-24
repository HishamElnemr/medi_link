import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/app_size.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/generated/l10n.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.logoFade,
    required this.textFade,
  });

  final Animation<double> logoFade;
  final Animation<double> textFade;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: logoFade,
            child: Center(
              child: Image.asset(
                Assets.assetsImagesLogoRB,
                width: AppSize.getScreenWidth(context)*.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FadeTransition(
            opacity: textFade,
            child: Text(
              S.of(context).MediLink,
              style: FontStyles.semiBold24.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
