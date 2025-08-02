import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';

void buildSnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? AppColors.primaryBlue,
    ),
  );
}
