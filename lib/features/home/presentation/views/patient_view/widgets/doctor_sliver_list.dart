import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_card.dart';

class DoctorSliverList extends StatelessWidget {
  final List<DoctorEntity> doctors;

  const DoctorSliverList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final doctor = doctors[index];
        return DoctorCard(
          doctorEntity: doctor,
          onPressed: () {},
          onFavPressed: () {},
        );
      }, childCount: doctors.length),
    );
  }
}
