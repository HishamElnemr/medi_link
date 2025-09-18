import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          width: 32,
          height: 27,
          color: AppColors.lightGrey.withOpacity(.9),
        ),
      ],
    );
  }
}
