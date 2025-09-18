import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          width: 30,
          height: 25,
          color: AppColors.white,
        ),
      ],
    );
  }
}
