import 'package:flutter/material.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required int selectedIndex,
    required Null Function(dynamic index) onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 298,
          height: 48,
          decoration: ShapeDecoration(
            color: const Color(0xFF225FFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
