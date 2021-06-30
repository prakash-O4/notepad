import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';

class Repo {
  final FavDatabase favDatabase = FavDatabase();
  List<FavModel> _favModel = [];
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
