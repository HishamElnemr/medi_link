import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';

class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SpecialtyCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.softBlue1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: iconSize(context),
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: _getFontSize(context),
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double iconSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 28 : 24;
  }

  double _getFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 14 : 12;
  }
}
