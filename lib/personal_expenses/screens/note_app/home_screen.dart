import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/model/note_model.dart';
import 'package:quiz/personal_expenses/screens/note_app/add_screen.dart';
import 'package:quiz/personal_expenses/screens/note_app/details_screen.dart';
import 'package:quiz/personal_expenses/widget/card_tile.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quiz/personal_expenses/widget/input_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc.add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    final DataBloc _addDataBloc = BlocProvider.of<DataBloc>(context);
    final DataBloc _detailDataBloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            color: Color(backgroundColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleCustomAlert(
                            text: "Long Press to delete the note",
                            isDev: true,
                          ),
                        );
                      },
                      child: IconCard(
                        icon: Icons.help,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                BlocBuilder<DataBloc, DataState>(
                  builder: (context, state) {
                    if (state is DataLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DataError) {
                      var message = state.errorMessage;
                      return Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                          ),
                        ),
                      );
                    } else if (state is DataLoaded) {
                      List<NoteModel> noteModel = state.noteModel;
                      // print(noteModel.length);
                      return Container(
                        child: noteModel.length != 0
                            ? StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                crossAxisCount: 4,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                itemCount: noteModel.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onLongPress: () {
                                      _dataBloc.add(
                                        DeleteItem(index: index),
                                      );
                                    },
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider.value(
                                            value: _detailDataBloc,
                                            child: DetaiScreen(
                                              noteModel: noteModel[index],
                                              index: index,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: BackGroundTile(
                                      backgroundColor:
                                          Color(noteModel[index].color),
                                      title: noteModel[index].title,
                                      date: noteModel[index].date,
                                    ),
                                  );
                                },
                                staggeredTileBuilder: (index) =>
                                    StaggeredTile.fit(2),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height - 90,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "Add some note 🙃",
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                      );
                    }
                    return Center(
                      child: Text(
                        "No state to load",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _addDataBloc,
                child: AddScreen(),
              ),
            ),
          );
        },
        backgroundColor: Color(backgroundColor),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
