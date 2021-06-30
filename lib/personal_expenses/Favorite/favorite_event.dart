part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteInital extends FavoriteEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FavoriteAdded extends FavoriteEvent {
  final String title;
  final String content;
  FavoriteAdded({required this.title, required this.content});
  @override
  List<Object?> get props => [title, content];
}

class DeleteFavorite extends FavoriteEvent {
  final int index;
  DeleteFavorite({required this.index});
  @override
  List<Object?> get props => [index];
}

class CheckIfFavorite extends FavoriteEvent {
  final int movieIndex;
  CheckIfFavorite({required this.movieIndex});
  @override
  List<Object?> get props => [movieIndex];
}

class ErrorFavorite extends FavoriteEvent {
  final String message;
  ErrorFavorite({required this.message});
  @override
  List<Object?> get props => [message];
}
