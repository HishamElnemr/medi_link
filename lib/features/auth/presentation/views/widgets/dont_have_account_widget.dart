
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: S.of(context).dont_have_account,
        style: FontStyles.regular14.copyWith(
          color :AppColors.darkGrey,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, RoutesName.signup);
            },
            text: ' ' + S.of(context).sign_up,
            style: FontStyles.regular14.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
