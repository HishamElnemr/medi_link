import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/models/profile_menu_item.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.item, this.onTap});

  final ProfileMenuItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.softBlue2,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(item.iconPath, color: AppColors.primaryBlue),
        ),
        title: Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.lightGrey,
          size: 24,
        ),
        onTap: onTap,
      ),
    );
  }
}
