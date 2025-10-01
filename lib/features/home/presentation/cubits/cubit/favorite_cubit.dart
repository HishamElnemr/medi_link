import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medi_link/core/services/shared_preferences_singleton.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';

part 'favorite_cubit_state.dart';

// FavoriteCubit
class FavoriteCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  final List<String> _favoriteIds = [];
  
  Future<void> loadFavorites() async {
    final favoriteIdsStored = await Prefs.getFavorites(
      BackendEndpoints.bookingsEndpoint,
    );
    _favoriteIds
      ..clear()
      ..addAll(favoriteIdsStored);
    emit(FavoriteCubitSuccess(favorites: List.from(_favoriteIds)));
  }

  Future<void> toggleFavorite(String doctorId) async {
    if (_favoriteIds.contains(doctorId)) {
      _favoriteIds.remove(doctorId);
      await Prefs.removeFavorite(BackendEndpoints.bookingsEndpoint, doctorId);
      emit(FavoriteCubitSuccess(favorites: List.from(_favoriteIds)));
    } else {
      _favoriteIds.add(doctorId);
      await Prefs.addFavorite(BackendEndpoints.bookingsEndpoint, doctorId);
      emit(FavoriteCubitSuccess(favorites: List.from(_favoriteIds)));
    }
  }

  Future<void> clearFavorites() async {
    _favoriteIds.clear();
    await Prefs.clearFavorites(BackendEndpoints.bookingsEndpoint);
    emit(FavoriteCubitSuccess(favorites: []));
  }
}
