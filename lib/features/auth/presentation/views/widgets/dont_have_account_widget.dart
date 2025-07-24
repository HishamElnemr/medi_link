
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'ليس لديك حساب؟',
        style: FontStyles.light12.copyWith(
          color :AppColors.darkGrey,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () 
            {
              // Navigator.pushNamed(context, SignupView.routeName);
            },
            text: ' انشاء حساب',
            style: FontStyles.regular14.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
