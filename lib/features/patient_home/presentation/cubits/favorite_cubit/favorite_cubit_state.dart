part of 'favorite_cubit.dart';

sealed class FavoriteCubitState {
  const FavoriteCubitState();
}

final class FavoriteCubitInitial extends FavoriteCubitState {}

final class FavoriteCubitSuccess extends FavoriteCubitState {
  final List<String> favorites;

  const FavoriteCubitSuccess({required this.favorites});
}
