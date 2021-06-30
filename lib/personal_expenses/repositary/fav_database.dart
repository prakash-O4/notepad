import 'package:hive/hive.dart';
import 'package:quiz/personal_expenses/model/fav_model.dart';

class FavDatabase {
  String _boxName = "FavNote";
  Future<Box> createBox() async {
    var box = await Hive.openBox<FavModel>(_boxName);
    return box;
  }

  //get all note from box
  Future<List<FavModel>> getNote() async {
    var box = await Hive.openBox<FavModel>(_boxName);
    List<FavModel> allNote = box.values.toList();
    // print("all notes returned");
    return allNote;
  }

//add notes to the box
  Future<void> addNote(FavModel favModel) async {
    final box = await createBox();
    await box.add(favModel);
  }

// delete note from the box
  Future<void> deleteNote(int index) async {
    final box = await createBox();
    await box.deleteAt(index);
  }
}
