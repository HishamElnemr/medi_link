import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';

class SpecialitiesWidget extends StatelessWidget {
  const SpecialitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).specialities,
          style: FontStyles.medium15.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RoutesName.specialitiesView);
          },
          child: Text(
            S.of(context).see_all,
            style: FontStyles.light12.copyWith(color: AppColors.primaryBlue),
          ),
        ),
      ],
    );
  }
}
