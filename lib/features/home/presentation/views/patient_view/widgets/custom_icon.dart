import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
