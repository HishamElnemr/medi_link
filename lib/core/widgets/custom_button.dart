import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.style,
    this.backgroundColor,
    this.isLoading = false,
  });
  final void Function() onPressed;
  final String text;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Color? backgroundColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 54,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isLoading
              ? AppColors.softBlue4
              : backgroundColor ?? AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).loading,
                    style: FontStyles.medium15.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(width: 15),
                  const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3,
                    ),
                  ),
                ],
              )
            : Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text,
                style:
                    style ??
                    FontStyles.medium15.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
