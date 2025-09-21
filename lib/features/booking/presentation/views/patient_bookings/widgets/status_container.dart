import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';

class StatusContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const StatusContainer({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(text, style: FontStyles.light12.copyWith(color: color)),
        ],
      ),
    );
  }
}