import 'package:flutter/material.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';

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
                    widget.dataBloc.add(AddDataEvent(
                        content: _numberController.text,
                        title: _headingController.text));
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
  final title;
  final DataBloc dataBloc;
  SimpleCustomAlert({required this.title, required this.dataBloc});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: CardInput(
        dataBloc: dataBloc,
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