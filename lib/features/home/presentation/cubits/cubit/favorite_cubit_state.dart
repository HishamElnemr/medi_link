part of 'favorite_cubit.dart';

sealed class FavoriteCubitState extends Equatable {
  const FavoriteCubitState();

  @override
  List<Object> get props => [];
}

final class FavoriteCubitInitial extends FavoriteCubitState {}

final class FavoriteCubitSuccess extends FavoriteCubitState {
  final List<String> favorites;
  FavoriteCubitSuccess({required this.favorites});
  @override
  List<Object> get props => [favorites];
}

final class FavoriteCubitFailure extends FavoriteCubitState 
{
  final String errMessage;

  const FavoriteCubitFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
