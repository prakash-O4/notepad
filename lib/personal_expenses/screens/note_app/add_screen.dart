import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late DataBloc _dataBloc;
  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTitle = TextEditingController();
    TextEditingController _controllerContent = TextEditingController();
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
                          _dataBloc.add(
                            AddDataEvent(
                                content: _controllerContent.text,
                                title: _controllerTitle.text),
                          );
                          // print("data added");
                          Navigator.pop(context);
                        },
                        child: IconCard(icon: Icons.save),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
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
                  TextField(
                    controller: _controllerContent,
                    maxLines: null,
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
                ],
              )),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
