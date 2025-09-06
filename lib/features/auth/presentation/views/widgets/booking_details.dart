import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/font_styles.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: FontStyles.regular14),
        const SizedBox(width: 30),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            value.toUpperCase(),
            style: FontStyles.medium15.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
