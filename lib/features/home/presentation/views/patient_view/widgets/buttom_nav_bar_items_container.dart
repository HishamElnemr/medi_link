import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/entities/bottom_nav_bar_entity.dart';
import 'package:medi_link/core/widgets/navigation_bar_item.dart';

class BottomNavBarItemsContainer extends StatelessWidget {
  const BottomNavBarItemsContainer({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 298 / 48,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bottomNavBarItems(context).asMap().entries.map((e) {
              var index = e.key;
              var entity = e.value;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onItemTapped(index),
                  child: NavigationBarItem(
                    isSelected: index == selectedIndex,
                    item: entity,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
