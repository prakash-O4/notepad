import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/model/note_model.dart';
import 'package:quiz/personal_expenses/repositary/note_database.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final NoteDatabase noteDataBase;
  List<NoteModel> _noteModel = [];
  DataBloc({required this.noteDataBase}) : super(DataInitial());

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is InitialEvent) {
      yield DataLoading();
      try {
        await _getNotes();
        yield DataLoaded(noteModel: _noteModel);
        print("Inital loaded");
      } catch (e) {
        yield DataError(errorMessage: "Initial Loading error");
      }
    } else if (event is DeleteItem) {
      yield DataLoading();
      try {
        await _deleteNote(index: event.index);
        yield DataLoaded(noteModel: _noteModel);
        //print("data deleted");
      } catch (e) {
        yield DataError(errorMessage: "Delete state error");
      }
    } else if (event is AddDataEvent) {
      yield DataLoading();
      try {
        await _addNote(
            title: event.title,
            content: event.content,
            date: event.date,
            color: event.color);
        yield DataLoaded(noteModel: _noteModel);
      } catch (e) {
        yield DataError(errorMessage: "Add state error");
      }
    } else if (event is UpdateItem) {
      yield DataLoading();
      try {
        await _updateNote(
          index: event.index,
          title: event.title,
          content: event.content,
          color: event.color,
          date: event.date,
        );
        print("data loaded");
        yield DataLoaded(noteModel: _noteModel);
      } catch (e) {
        yield DataError(errorMessage: "update error");
      }
    }
  }

  //Helper function
  //get all notes from database
  Future<void> _getNotes() async {
    await noteDataBase.getNote().then((value) {
      _noteModel = value;
    });
    print("note retrived");
  }

  // add note to the database
  Future<void> _addNote({
    required String title,
    required String content,
    required int color,
    required String date,
  }) async {
    await noteDataBase.addNote(
      NoteModel(
        title: title,
        content: content,
        color: color,
        date: date,
      ),
    );
    await _getNotes();
  }

// delete note from the database
  Future<void> _deleteNote({required int index}) async {
    await noteDataBase.deleteNote(index);
    await _getNotes();
  }

  Future<void> _updateNote({
    required int index,
    required String title,
    required String content,
    required int color,
    required String date,
  }) async {
    print("inside update note repo");
    await noteDataBase.updateNote(
      index,
      NoteModel(
        title: title,
        content: content,
        color: color,
        date: date,
      ),
    );
    print("before getting notes");
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
