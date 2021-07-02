import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';
import 'package:quiz/personal_expenses/widget/input_card.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerContent;
  late DataBloc _addDataBloc;
  @override
  void initState() {
    super.initState();
    _addDataBloc = BlocProvider.of(context);
    _controllerTitle = TextEditingController();
    _controllerContent = TextEditingController();
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
    return formattedDate;
  }

  checkTextField() {}

  @override
  void dispose() {
    super.dispose();
    _controllerTitle.dispose();
    _controllerContent.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: IconCard(
                          icon: Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          var color = returnColor();
                          var date = currentDate();
                          if (_controllerTitle.value.text.isNotEmpty &&
                              _controllerContent.value.text.isNotEmpty) {
                            _addDataBloc.add(
                              AddDataEvent(
                                content: _controllerContent.text,
                                title: _controllerTitle.text,
                                color: color,
                                date: date,
                              ),
                            );
                            // print("data added");
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleCustomAlert(
                                text:
                                    "Please insert both title and content to save",
                                isDev: false,
                              ),
                            );
                          }
                        },
                        child: IconCard(icon: Icons.save),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    controller: _controllerTitle,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: -4,
                      ),
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 28,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 130,
                    ),
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: _controllerContent,
                        maxLines: null,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1,
                          ),
                          border: InputBorder.none,
                          hintText: "Type something....",
                          hintStyle: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 26,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
