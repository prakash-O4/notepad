part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable {}

class InitialEvent extends DataEvent {
  @override
  List<Object?> get props => [];
}

class AddDataEvent extends DataEvent {
  final String title;
  final String content;
  final int color;
  final String date;
  AddDataEvent({
    required this.content,
    required this.title,
    required this.color,
    required this.date,
  });
  @override
  List<Object?> get props => [content, title,color,date];
}

class DeleteItem extends DataEvent {
  final int index;
  DeleteItem({required this.index});
  @override
  List<Object?> get props => [index];
}

class UpdateItem extends DataEvent {
  final int index;
  final String title;
  final String content;
  final int color;
  final String date;
  UpdateItem({
    required this.color,
    required this.content,
    required this.title,
    required this.index,
    required this.date,
  });
  @override
  List<Object?> get props => [index,title,content,color,date];
}

class AddFavorite extends DataEvent {
  final String title;
  final String content;
  AddFavorite({required this.title, required this.content});
  @override
  List<Object?> get props => [title, content];
}

class DeleteFavItem extends DataEvent {
  final int index;
  DeleteFavItem({required this.index});
  @override
  List<Object?> get props => [index];
}
