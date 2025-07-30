import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_card.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'name': 'هشام أحمد',
        'specialty': 'Dermato-Endocrinology',
        'rating': 5.0,
        'reviews': 60,
      },
      {
        'name': 'Alexander Bennett',
        'specialty': 'Clinical Genetics',
        'rating': 4.5,
        'reviews': 40,
      },
      {
        'name': 'Sophia Martinez',
        'specialty': 'Cosmetic Bioengineering',
        'rating': 5.0,
        'reviews': 150,
      },
      {
        'name': 'Michael Davidson',
        'specialty': 'Nano-Dermatology',
        'rating': 4.8,
        'reviews': 90,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(
          doctorName: doctor['name'] as String,
          specialty: doctor['specialty'] as String,
          rating: doctor['rating'] as double,
          reviews: doctor['reviews'] as int,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('تم حجز موعد مع ${doctor['name']}'),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },
    );
  }
}
