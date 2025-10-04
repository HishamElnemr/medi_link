import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';

part 'favorite_cubit_state.dart';

// FavoriteCubit
class FavoriteCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  final List<String> _favoriteIds = [];

  Future<void> loadFavorites() async {
    log('🔵 [FavoriteCubit] loadFavorites started');
    final favoriteIdsStored = await Prefs.getFavorites(
      BackendEndpoints.bookingsEndpoint,
    );
    _favoriteIds
      ..clear()
      ..addAll(favoriteIdsStored);
    log('🔵 [FavoriteCubit] Loaded favorites: $_favoriteIds');
    emit(FavoriteCubitSuccess(favorites: List.from(_favoriteIds)));
    log('🔵 [FavoriteCubit] Emitted FavoriteCubitSuccess');
  }

  Future<void> toggleFavorite(String doctorId) async {
    log('🟢 [FavoriteCubit] toggleFavorite called for: $doctorId');
    log('🟢 [FavoriteCubit] Current favorites before: $_favoriteIds');

    if (_favoriteIds.contains(doctorId)) {
      _favoriteIds.remove(doctorId);
      await Prefs.removeFavorite(BackendEndpoints.bookingsEndpoint, doctorId);
      log('🟢 [FavoriteCubit] Removed from favorites');
    } else {
      _favoriteIds.add(doctorId);
      await Prefs.addFavorite(BackendEndpoints.bookingsEndpoint, doctorId);
      log('🟢 [FavoriteCubit] Added to favorites');
    }

    log('🟢 [FavoriteCubit] Current favorites after: $_favoriteIds');
    emit(FavoriteCubitSuccess(favorites: List.from(_favoriteIds)));
    log('🟢 [FavoriteCubit] Emitted new FavoriteCubitSuccess');
  }

  Future<void> clearFavorites() async {
    _favoriteIds.clear();
    await Prefs.clearFavorites(BackendEndpoints.bookingsEndpoint);
    emit(const FavoriteCubitSuccess(favorites: []));
  }
}
