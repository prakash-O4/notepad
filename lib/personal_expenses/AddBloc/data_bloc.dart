import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';
import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/repositary/database.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final FavDatabase favDatabase;
  final NoteDataBase noteDataBase;
  List<ExpenseModel> _expenseModel = [];
  // List<FavModel> _favModel = [];
  DataBloc({required this.noteDataBase, required this.favDatabase})
      : super(DataInitial());

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is InitialEvent) {
      yield DataLoading();
      try {
        await _getNotes();
        yield DataLoaded(expenseModel: _expenseModel);
        //print("Inital loaded");
      } catch (e) {
        yield DataError(errorMessage: "Initial Loading error");
      }
    } else if (event is DeleteItem) {
      yield DataLoading();
      try {
        await _deleteNote(index: event.index);
        yield DataLoaded(expenseModel: _expenseModel);
        //print("data deleted");
      } catch (e) {
        yield DataError(errorMessage: "Delete state error");
      }
    } else if (event is AddDataEvent) {
      yield DataLoading();
      try {
        //print("inside figure");
        await _addNote(title: event.title, content: event.content);
        yield DataLoaded(expenseModel: _expenseModel);
        // print("data added !");
      } catch (e) {
        yield DataError(errorMessage: "Add state error");
      }
    }
  }

  //Helper function
  //get all notes from database
  Future<void> _getNotes() async {
    await noteDataBase.getNote().then((value) {
      _expenseModel = value;
    });
  }

  // add note to the database
  Future<void> _addNote(
      {required String title, required String content}) async {
    await noteDataBase.addNote(ExpenseModel(heading: title, number: content));
    await _getNotes();
  }

// delete note from the database
  Future<void> _deleteNote({required int index}) async {
    await noteDataBase.deleteNote(index);
    await _getNotes();
  }

//-----------------------------------------------------------------------------//
// else if (event is DeleteFavItem) {
  //   yield DataLoading();
  //   try {
  //     await _deleteFavNote(index: event.index);
  //     yield AddFavorites(favModel: _favModel);
  //   } catch (e) {
  //     yield DataError(errorMessage: "fav deletion error");
  //   }
  // }
  //-----------------------------------------------------------------------------//
  // else if (event is AddFavorite) {
  //     yield DataLoading();
  //     // yield DataLoaded(expenseModel: _expenseModel);
  //     try {
  //       await _addToFav(
  //         title: event.title,
  //         content: event.content,
  //         isFav: true,
  //       );
  //       // print("data loaded");
  //       // yield DataLoaded(expenseModel: _expenseModel);
  //       print("fav model loaded");
  //       yield AddFavorites(favModel: _favModel);
  //     } catch (e) {
  //       yield DataError(errorMessage: "Fav error");
  //     }
  //   }
}
