import 'dart:async';
import 'dart:core';
import 'package:hive/hive.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';

//open box
class NoteDataBase {
  String _boxName = "Note";

  Future<Box> createBox() async {
    var box = await Hive.openBox<ExpenseModel>(_boxName);
    return box;
  }

  //get all note from box
  Future<List<ExpenseModel>> getNote() async {
    var box = await Hive.openBox<ExpenseModel>(_boxName);
    List<ExpenseModel> allNote = box.values.toList();
    return allNote;
  }

//add notes to the box
  Future<void> addNote(ExpenseModel expenseModel) async {
    final box = await createBox();
    await box.add(expenseModel);
  }

// delete note from the box
  Future<void> deleteNote(int index) async {
    final box = await createBox();
    await box.deleteAt(index);
  }

  Future<ExpenseModel> getANote(int index) async {
    final box = await createBox();
    var data = await box.getAt(index);
    return data;
  }
}
