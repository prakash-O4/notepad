import 'package:flutter/material.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';
import 'package:quiz/personal_expenses/screens/note_app/add_screen.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';

class DetaiScreen extends StatelessWidget {
  final ExpenseModel expenseModel;
  const DetaiScreen({required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            IconCard(icon: Icons.arrow_back_ios_new_rounded)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddScreen(),
                          ),
                        );
                      },
                      child: IconCard(icon: Icons.edit),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  expenseModel.heading,
                  style: TextStyle(
                    height: 1.6,
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "May 21, 2021",
                  style: TextStyle(
                    color: Color(dateColor),
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  expenseModel.number,
                  style: TextStyle(
                    height: 1.6,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// '''In no impression assistance contrasted. Manners she wishing justice hastily new anxious. At discovery discourse departure objection we. Few extensive add delighted tolerably sincerity her. Law ought him least enjoy decay one quick court. Expect warmly its tended garden him esteem had remove off. Effects dearest staying now sixteen nor improve. 
        
//         Extremely we promotion remainder eagerness enjoyment an. Ham her demands removal brought minuter raising invited gay. Contented consisted continual curiosity contained get sex. Forth child dried in in aware do. You had met they song how feel lain evil near. Small she avoid six yet table china. And bed make say been then dine mrs. To household rapturous fulfilled attempted on so.'''
