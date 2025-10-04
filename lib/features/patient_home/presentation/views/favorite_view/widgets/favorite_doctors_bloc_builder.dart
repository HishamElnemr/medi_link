import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/core/utils/doctor_card_skeltonizer_loading.dart';
import 'package:medi_link/features/auth/domain/entites/doctor_entity.dart';
import 'package:medi_link/features/patient_home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:medi_link/features/patient_home/presentation/views/favorite_view/widgets/get_doctors_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteDoctorsList extends StatelessWidget {
  const FavoriteDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteCubitState>(
      builder: (context, favoriteState) {
        if (favoriteState is FavoriteCubitInitial) {
          return const SliverFillRemaining(
            child: Skeletonizer(child: DoctorCardSkeltonizerLoading()),
          );
        }

        final favorites = favoriteState is FavoriteCubitSuccess
            ? favoriteState.favorites
            : <String>[];

        if (favorites.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                S.of(context).there_is_no_doctors_in_favorites,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }
        return GetDoctorsBlocBuilder(
          favorites: favorites,
          onFavoriteToggle: _handleFavoriteToggle,
        );
      },
    );
  }

  Future<void> _handleFavoriteToggle(
    BuildContext context,
    DoctorEntity doctor,
    bool currentlyFavorite,
  ) async {
    await context.read<FavoriteCubit>().toggleFavorite(doctor.id);

    if (context.mounted) {
      buildSnackBar(
        context,
        currentlyFavorite
            ? S.of(context).doctor_removed_from_favorites
            : S.of(context).doctor_added_to_favorites,
      );
    }
  }
}
