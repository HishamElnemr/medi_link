import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/specialty_card.dart';

class MedicalSpecialtiesGrid extends StatelessWidget {
  const MedicalSpecialtiesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final specialties = [
      {'icon': Icons.favorite_outlined, 'title': 'Heart'},
      {'icon': Icons.medical_services_outlined, 'title': 'Dental'},
      {'icon': Icons.water_drop_outlined, 'title': 'Kidney'},
      {'icon': Icons.restaurant_outlined, 'title': 'Stomach'},
      {'icon': Icons.air_outlined, 'title': 'Lung'},
      {'icon': Icons.psychology_outlined, 'title': 'Brain'},
      {'icon': Icons.mood_outlined, 'title': 'Mental'},
      {'icon': Icons.local_hospital_outlined, 'title': 'Liver'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
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
          return SpecialtyCard(
            icon: specialties[index]['icon'] as IconData,
            title: specialties[index]['title'] as String,
            onTap: () {},
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
