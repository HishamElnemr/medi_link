import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/constants.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool isVisible = true,
  Color? backgroundColor,
}) {
  return AppBar(
    leading: Visibility(
      visible: isVisible,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.primaryBlue,
      ),
    ),
    actions: [
      Padding(padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding)),
    ],
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: FontStyles.semiBold24.copyWith(
        color: AppColors.primaryBlue,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
