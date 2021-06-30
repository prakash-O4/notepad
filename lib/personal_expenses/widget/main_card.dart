import 'package:flutter/material.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';
import 'package:quiz/personal_expenses/widget/card_data.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.appBar,
    required this.expenseData,
    required DataBloc dataBloc,
  })  : _dataBloc = dataBloc,
        super(key: key);

  final AppBar appBar;
  final List<ExpenseModel> expenseData;
  final DataBloc _dataBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 25, right: 8, bottom: 30),
      color: Colors.grey,
      height: (MediaQuery.of(context).size.height -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top),
      child: expenseData.length != 0
          ? ListView.builder(
              itemCount: expenseData.length,
              itemBuilder: (BuildContext context, int index) {
                return Data(
                  heading: expenseData[index].heading,
                  number: expenseData[index].number,
                  index: index,
                  dataBloc: _dataBloc,
                );
              },
            )
          : Center(
              child: Text(
                "Please add some data\nClick appbar icon for Quiz Game",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
    );
  }
}
