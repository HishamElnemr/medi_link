import 'package:flutter/material.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/views/patient_view/widgets/doctor_list_view.dart';

class FavoriteDoctorsListView extends StatelessWidget {
  final List<DoctorEntity> favoriteDoctors;
  final List<String> favorites;
  final Future<void> Function(
    BuildContext,
    DoctorEntity doctor,
    bool currentlyFavorite,
  )
  onFavoriteToggle;

  const FavoriteDoctorsListView({
    super.key,
    required this.favoriteDoctors,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return DoctorListView(
          doctors: [favoriteDoctors[index]],
          favorites: favorites,
          onFavoriteToggle: (doctor, currentlyFavorite) {
            onFavoriteToggle(context, doctor, currentlyFavorite);
          },
        );
      }, childCount: favoriteDoctors.length),
    );
  }

}
