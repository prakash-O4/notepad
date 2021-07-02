import 'package:hive/hive.dart';
import 'package:quiz/personal_expenses/model/note_model.dart';

class NoteDatabase {
  String _boxname = "NoteData";

  //opening box to store data
  Future<Box> createBox() async {
    Box box = await Hive.openBox<NoteModel>(_boxname);
    return box;
  }

  //get all data from the box
  Future<List<NoteModel>> getNote() async {
    var box = await Hive.openBox<NoteModel>(_boxname);
    List<NoteModel> _noteModel = box.values.toList();
    return _noteModel;
  }

  //add data to the box
  Future<void> addNote(NoteModel noteModel) async {
    var box = await createBox();
    await box.add(noteModel);
  }

  //delete data from the box
  Future<void> deleteNote(int index) async {
    var box = await createBox();
    await box.deleteAt(index);
  }

  //update data from the box
  Future<void> updateNote(int index, NoteModel noteModel) async {
    var box = await createBox();
    await box.putAt(index, noteModel);
    print("notes updated");
  }
}
