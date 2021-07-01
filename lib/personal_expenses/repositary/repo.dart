import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';

class Repo {
  final FavDatabase favDatabase = FavDatabase();
  // ignore: unused_field
  List<FavModel> _favModel = [];
  Future<void> _getFavNote() async {
    await favDatabase.getNote().then((value) {
      _favModel = value;
    });
  }

  // ignore: unused_element
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

  // ignore: unused_element
  Future<void> _deleteFavNote({required int index}) async {
    await favDatabase.deleteNote(index);
    await _getFavNote();
  }
}
