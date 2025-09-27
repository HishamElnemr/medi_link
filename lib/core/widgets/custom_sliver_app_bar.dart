import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.primaryBlue,
      ),
      actions: [
        Padding(padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding)),
      ],
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: FontStyles.semiBold24.copyWith(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
