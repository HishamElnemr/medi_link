import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/get_doctors/get_doctors_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/favorite_view/widgets/favorite_doctors_list_view.dart';

class GetDoctorsBlocBuilder extends StatelessWidget {
  final List<String> favorites;
  final Future<void> Function(BuildContext, DoctorEntity doctor, bool currentlyFavorite) onFavoriteToggle;

  const GetDoctorsBlocBuilder({
    super.key,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorsCubit, GetDoctorsState>(
      builder: (context, state) {
        if (state is GetDoctorsSuccess) {
          final favoriteDoctors = state.doctors
              .where((doctor) => favorites.contains(doctor.id))
              .toList();

          if (favoriteDoctors.isEmpty) {
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }

          return FavoriteDoctorsListView(
            favoriteDoctors: favoriteDoctors,
            favorites: favorites,
            onFavoriteToggle: onFavoriteToggle,
          );
        }

        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
