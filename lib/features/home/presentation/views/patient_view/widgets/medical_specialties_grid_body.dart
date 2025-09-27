import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/all_specialty_utils.dart';
import 'package:medi_link/core/utils/constants.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/specialty_card_body.dart';

class MedicalSpecialtiesGridBody extends StatelessWidget {
  const MedicalSpecialtiesGridBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 20,
      ),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: AllSpecialtyUtils.allSpecialtiesList.length,
        itemBuilder: (context, index) {
          final speciality = AllSpecialtyUtils.allSpecialtiesList[index];
          return SpecialtyCardBody(
            icon: speciality.icon,
            title: AllSpecialtyUtils.getLocalizedSpecialty(
              context,
              speciality.titleKey,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
