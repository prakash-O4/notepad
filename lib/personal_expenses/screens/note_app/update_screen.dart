import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/model/note_model.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';
import 'package:quiz/personal_expenses/widget/input_card.dart';

class UpdateScreen extends StatefulWidget {
  final NoteModel noteModel;
  final int index;
  const UpdateScreen({required this.noteModel, required this.index});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<UpdateScreen> {
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerContent;
  @override
  void initState() {
    super.initState();
    _controllerTitle = TextEditingController(text: widget.noteModel.title);
    _controllerContent = TextEditingController(text: widget.noteModel.content);
  }

  currentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  @override
  void dispose() {
    _controllerContent.dispose();
    _controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const IconCard(
                          icon: Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_controllerTitle.value.text.isNotEmpty &&
                              _controllerContent.value.text.isNotEmpty) {
                            var date = currentDate();
                            BlocProvider.of<DataBloc>(context).add(
                              UpdateItem(
                                index: widget.index,
                                content: _controllerContent.text,
                                title: _controllerTitle.text,
                                color: widget.noteModel.color,
                                date: date,
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            SimpleCustomAlert(
                              text:
                                  "Please insert both title and content to save",
                              isDev: false,
                            );
                          }
                        },
                        child: const IconCard(icon: Icons.save),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    textInputAction: TextInputAction.done,
                    controller: _controllerTitle,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: -4,
                      ),
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 28,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    textInputAction: TextInputAction.done,
                    controller: _controllerContent,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1,
                      ),
                      border: InputBorder.none,
                      hintText: "Type something....",
                      hintStyle: const TextStyle(
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
