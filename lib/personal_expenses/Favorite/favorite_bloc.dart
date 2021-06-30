import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavDatabase favDatabase;
  List<FavModel> _favModel = [];
  FavoriteBloc({required this.favDatabase}) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoriteInital) {
      yield FavLoading();
      try {
        await _getFavNote();
        yield FavoritesLoaded(favModel: _favModel);
      } catch (e) {
        yield FavError(message: "fav error message");
      }
    } else if (event is FavoriteAdded) {
      yield FavLoading();
      try {
        await _addToFav(
          title: event.title,
          content: event.content,
          isFav: true,
        );
        yield FavoritesLoaded(favModel: _favModel);
      } catch (e) {
        yield FavError(message: "Fav error messgae");
      }
    }
  }

  Future<void> _getFavNote() async {
    await favDatabase.getNote().then((value) {
      _favModel = value;
    });
  }

  Future<void> _addToFav(
      {required String title,
      required String content,
      required bool isFav}) async {
    await favDatabase.addNote(
      FavModel(
        content: content,
        isFavorite: isFav,
        title: title,
      ),
    );

    await _getFavNote();
  }

  Future<void> _deleteFavNote({required int index}) async {
    await favDatabase.deleteNote(index);
    await _getFavNote();
  }
}
