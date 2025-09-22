import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(color: Color(0xffC9CECF), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(
            'أو',
            style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xffC9CECF), thickness: 1)),
      ],
    );
  }
}
