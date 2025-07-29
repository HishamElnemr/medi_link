import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/specialty_card.dart';
import 'package:medi_link/generated/l10n.dart';

class MedicalSpecialtiesGrid extends StatefulWidget {
  const MedicalSpecialtiesGrid({super.key});

  @override
  State<MedicalSpecialtiesGrid> createState() => _MedicalSpecialtiesGridState();
}

class _MedicalSpecialtiesGridState extends State<MedicalSpecialtiesGrid> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final specialties = [
      {
        'icon': Assets.assetsImagesAll,
        'title': S.of(context).all,
      },
      {
        'icon': Assets.assetsImagesCadiologist,
        'title': S.of(context).cardiology,
      },
      {'icon': Assets.assetsImagesDentists, 'title': S.of(context).dentistry},
      {
        'icon': Assets.assetsImagesNephrologists,
        'title': S.of(context).nephrology,
      },
      {
        'icon': Assets.assetsImagesGastroenterologists,
        'title': S.of(context).internal_medicine,
      },
      {
        'icon': Assets.assetsImagesPulmonologists,
        'title': S.of(context).pulmonology,
      },
      {
        'icon': Assets.assetsImagesPsychiatrists,
        'title': S.of(context).psychiatry,
      },
      {'icon': Assets.assetsImagesHepatologists, 'title': S.of(context).liver},
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: _getChildAspectRatio(context),
        ),
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return SpecialtyCard(
            icon: specialties[index]['icon'] as String,
            title: specialties[index]['title'] as String,
            backgroundColor: isSelected ? Theme.of(context).primaryColor : null,
            iconColor: isSelected ? Colors.white : null,
            textColor: isSelected ? Colors.white : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 6;
    if (width > 900) return 5;
    if (width > 600) return 4;
    return 4;
  }

  double _getChildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 600) return 1.0;
    return 0.9;
  }
}
