part of 'data_bloc.dart';

@immutable
abstract class DataState extends Equatable {}

class DataInitial extends DataState {
  @override
  List<Object?> get props => [];
}

class DataLoading extends DataState {
  @override
  List<Object?> get props => [];
}

class DataLoaded extends DataState {
  final List<NoteModel> noteModel;
  DataLoaded({required this.noteModel});
  List<Object?> get props => [noteModel];
}

class DataError extends DataState {
  final String errorMessage;
  DataError({required this.errorMessage});
  @override
  List<Object?> get props => [];
}

class AddFavorites extends DataState {
  final List<FavModel> favModel;
  AddFavorites({required this.favModel});
  @override
  List<Object?> get props => [favModel];
}
