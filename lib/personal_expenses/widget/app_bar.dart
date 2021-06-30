import 'package:flutter/material.dart';
import 'package:quiz/rough.dart';

AppBar appBarWidget(BuildContext context) {
  AppBar appBar = AppBar(
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
