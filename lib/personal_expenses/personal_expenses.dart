import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';
import 'package:quiz/personal_expenses/screens/note_app/home_screen.dart';
import 'package:quiz/personal_expenses/widget/input_card.dart';
import 'package:quiz/rough.dart';

class PersonalExpenses extends StatefulWidget {
  const PersonalExpenses();

  @override
  _PersonalExpensesState createState() => _PersonalExpensesState();
}

class _PersonalExpensesState extends State<PersonalExpenses> {
  FavDatabase favDatabase = FavDatabase();
  late TextEditingController _textEditingController;
  late AppBar appBar;
  late DataBloc _dataBloc;
  AppBar topWidget(BuildContext context) {
    appBar = AppBar(
      backgroundColor: Colors.grey,
      title: Text(
        "Personal Expenses App",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizGame(),
                ),
              );
            },
            icon: Icon(
              Icons.navigate_next_rounded,
              size: 26,
              color: Colors.white,
            ))
      ],
    );
    return appBar;
  }

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc..add(InitialEvent());
  }

  @override
  void dispose() {
    _dataBloc.close();
    Hive.close();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: topWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DataLoaded) {
                  // var expenseData = state.noteModel;
                  return Container();
                  // MainCard(
                  //   appBar: appBar,
                  //   expenseData: expenseData,
                  //   dataBloc: _dataBloc,
                  // );
                } else if (state is DataError) {
                  var messagge = state.errorMessage;
                  return Center(
                    child: Text(
                      messagge,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Clik down button to add',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "hero1",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleCustomAlert(
                  title: "Prakash Banset",
                  dataBloc: _dataBloc,
                ),
              );
            },
            child: Center(
              child: Icon(
                Icons.add,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: "hero2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Center(
              child: Icon(
                Icons.navigate_next_rounded,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}





      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => BlocProvider.value(
      //                 value: _dataBloc,
      //                 child: Favorite(),
      //               ),
      //             ),
      //           );
      //         },
      //         child: Text(
      //           "Fav page",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

// Container(
//                               height: 500,
//                               color: Colors.grey,
//                               child: Column(
//                                 children: [
//                                   TextField(
//                                     focusNode: _focusNode,
//                                     controller: _textEditingControllerContent,
//                                   ),
//                                   SizedBox(
//                                     height: 7,
//                                   ),
//                                   TextField(
//                                     focusNode: _focusNodeContent,
//                                     controller: _textEditingController,
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   ValueListenableBuilder<TextEditingValue>(
//                                     valueListenable: _focusNode.nextFocus()
//                                         ? _textEditingController
//                                         : _textEditingControllerContent,
//                                     builder: (context, value, child) {
//                                       return ElevatedButton(
//                                           onPressed: value.text.isNotEmpty
//                                               ? () {
//                                                   print('okay');
//                                                 }
//                                               : null,
//                                           child: Text(
//                                               "Enter some value to enable me"));
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ));