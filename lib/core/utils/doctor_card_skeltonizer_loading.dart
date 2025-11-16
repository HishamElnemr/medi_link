import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_card.dart';

class DoctorCardSkeltonizerLoading extends StatelessWidget {
  const DoctorCardSkeltonizerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DoctorCard(
            onTap: () {},
            doctorEntity: DoctorEntity(
              biography: 'text',
              id: '13',
              firstName: 'Ali',
              lastName: 'Mohamed',
              speciality: 'Cardiologist',
              age: 25,
              gender: 'Male',
              address: 'Giza, Cairo, Egypt',
              phoneNumber: 0123456789,
              email: 'fG9pU@example.com',
              imageUrl: '',
              image: File(''),
              sallary: 50,
              yearsOfExperience: 5,
              hospitalName: 'Cairo Hospital',
            ),
            isFavorite: false,
            onFavPressed: () {},
            onPressed: () {},
          ),
        );
      },
      itemCount: 3,
    );
  }
}
