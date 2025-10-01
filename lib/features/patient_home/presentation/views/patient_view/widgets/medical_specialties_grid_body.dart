import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/specialty_card_body.dart';
import 'package:medi_link/generated/l10n.dart';

class MedicalSpecialtiesGridBody extends StatelessWidget {
  const MedicalSpecialtiesGridBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).specialities),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: 20,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final speciality = AllSpecialtyUtils.allSpecialtiesList[index];
              return SpecialtyCardBody(
                icon: speciality.icon,
                title: AllSpecialtyUtils.getLocalizedSpecialty(
                  context,
                  speciality.titleKey,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RoutesName.doctorsBySpecialityView,
                    arguments: speciality.rawName,
                  );
                },
              );
            }, childCount: AllSpecialtyUtils.allSpecialtiesList.length),
          ),
        ),
      ],
    );
  }
}
