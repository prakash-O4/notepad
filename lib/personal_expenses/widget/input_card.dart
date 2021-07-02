import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';

class CardInput extends StatefulWidget {
  final DataBloc dataBloc;
  CardInput({required this.dataBloc});
  @override
  _CardInputState createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {
  TextEditingController _headingController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  // Widget disableButton(TextEditingController t1, TextEditingController t2) {
  //   return ElevatedButton(onPressed: (){}, child: Text("data"));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 240,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              "Add data",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TextField(
              controller: _headingController,
              decoration: InputDecoration(
                hintText: "Enter the name of the item",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TextField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: "Enter the number of the item",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {
                setState(
                  () {
                    // widget.dataBloc.add(
                    //   AddDataEvent(
                    //       content: _numberController.text,
                    //       title: _headingController.text),
                    // );
                    Navigator.pop(context);
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  "Add Data",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SimpleCustomAlert extends StatelessWidget {
  final String text;
  final bool isDev;
  SimpleCustomAlert({required this.text, required this.isDev});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Helper(
        text: text,
        isDev: isDev,
      ),
    );
  }
}

class Helper extends StatelessWidget {
  final String text;
  final bool isDev;
  const Helper({required this.text, required this.isDev});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(22),
      color: Color(backgroundColor),
      elevation: 5,
      child: Container(
        padding: isDev == true
            ? EdgeInsets.only(
                left: 12,
                right: 12,
                top: 4,
              )
            : EdgeInsets.only(
                left: 12,
                right: 12,
                top: 16,
              ),
        height: isDev == true
            ? MediaQuery.of(context).size.height / 3.2
            : MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width * 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(
            backgroundColor,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            isDev == true
                ? Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Feedback will be appreciated!",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
 // expenseModels.add(
                    //   ExpenseModel(
                    //     heading: _headingController.text,
                    //     number: _numberController.text,
                    //   ),
                    // );