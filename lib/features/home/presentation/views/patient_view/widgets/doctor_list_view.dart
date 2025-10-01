import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/get_patient_data.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_card.dart';

import '../../../../../auth/domain/entites/doctor_entity.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({
    super.key,
    required this.doctors,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  final List<DoctorEntity> doctors;
  final List<String> favorites;
  final Function(DoctorEntity doctor, bool currentlyFavorite) onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        final isFavorite = favorites.contains(doctor.id);

        return DoctorCard(
          isFavorite: isFavorite,
          onFavPressed: () => onFavoriteToggle(doctor, isFavorite),
          doctorEntity: doctor,
          onPressed: () => _handleBookingNavigation(context, doctor),
        );
      },
    );
  }

  Future<void> _handleBookingNavigation(
    BuildContext context,
    DoctorEntity doctor,
  ) async {
    final result = await Navigator.pushNamed(
      context,
      RoutesName.booking,
      arguments: doctor,
    );

    if (result == true && context.mounted) {
      final patientId = getPatientData().id;
      context.read<BookingCubit>().getPatientBookings(patientId);
    }
  }
}
