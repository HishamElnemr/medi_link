import 'package:flutter/material.dart';
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
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: BottomNavBarItemsContainer(
            onItemTapped: onItemTapped,
            selectedIndex: selectedIndex,
          ),
        ),
      ),
    );
  }
}
