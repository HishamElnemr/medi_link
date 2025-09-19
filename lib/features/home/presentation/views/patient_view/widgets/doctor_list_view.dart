import 'package:flutter/material.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_card.dart';

import '../../../../../auth/domain/entites/doctor_entity.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          doctorEntity: doctors[index],
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutesName.booking,
              arguments: doctors[index],
            );
          },
        );
      },
    );
  }
}
