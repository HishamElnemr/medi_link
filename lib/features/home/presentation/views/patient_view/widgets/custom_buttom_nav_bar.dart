import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/buttom_nav_bar_items_container.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });
  final void Function(int) onItemTapped;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 77 + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(color: AppColors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: BottomNavBarItemsContainer(
          onItemTapped: onItemTapped,
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
