part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FavLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoritesLoaded extends FavoriteState {
  final List<FavModel> favModel;
  FavoritesLoaded({required this.favModel});
  @override
  List<Object?> get props => [favModel];
}

class FavError extends FavoriteState {
  final String message;
  FavError({required this.message});
  @override
  List<Object?> get props => [message];
}
