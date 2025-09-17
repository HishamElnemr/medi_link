import 'package:flutter/material.dart';
import 'package:medi_link/core/entities/bottom_nav_bar_entity.dart';
import 'package:medi_link/core/widgets/active_item.dart';
import 'package:medi_link/core/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.item,
  });
  final bool isSelected;
  final BottomNavBarEntity item;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(text: item.name, image: item.activeImage)
        : InActiveItem(image: item.inActiveImage, text: item.name);
  }
}
