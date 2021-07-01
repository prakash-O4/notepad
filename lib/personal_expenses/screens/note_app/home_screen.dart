import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';
import 'package:quiz/personal_expenses/screens/note_app/add_screen.dart';
import 'package:quiz/personal_expenses/screens/note_app/details_screen.dart';
import 'package:quiz/personal_expenses/widget/card_tile.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  returnColor() {
    var data = Random().nextInt(cardColor.length);
    var colorData = cardColor[data];
    return colorData;
  }

  currentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // returnColor();
                        currentDate();
                      },
                      child: IconCard(
                        icon: Icons.search_rounded,
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
                      List<ExpenseModel> expenseModel = state.expenseModel;
                      print(expenseModel.length);
                      return Container(
                        child: expenseModel.length != 0
                            ? StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                crossAxisCount: 4,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                itemCount: expenseModel.length,
                                itemBuilder: (context, index) {
                                  var number = returnColor();

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
                                          builder: (context) => DetaiScreen(
                                            expenseModel: expenseModel[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: BackGroundTile(
                                      backgroundColor: Color(number),
                                      title: expenseModel[index].heading,
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
                value: _dataBloc,
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
