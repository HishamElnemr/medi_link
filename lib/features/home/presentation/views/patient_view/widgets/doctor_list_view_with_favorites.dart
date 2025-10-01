import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/helper/build_snack_bar.dart';
import 'package:medi_link/features/home/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/doctor_list_view.dart';
import 'package:medi_link/generated/l10n.dart';

import '../../../../../auth/domain/entites/doctor_entity.dart';

class DoctorListViewWithFavorites extends StatelessWidget {
  const DoctorListViewWithFavorites({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteCubitState>(
      builder: (context, state) {
        if (state is FavoriteCubitInitial) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<FavoriteCubit>().loadFavorites();
          });
        }

        final favorites = state is FavoriteCubitSuccess
            ? state.favorites
            : <String>[];

        return DoctorListView(
          doctors: doctors,
          favorites: favorites,
          onFavoriteToggle: (doctor, currentlyFavorite) {
            _handleFavoriteToggle(context, doctor, currentlyFavorite);
          },
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
