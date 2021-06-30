import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

class Game extends StatelessWidget {
  final int questionIndex;
  final Function checkAnswer;
  final Function nextQuestion;
  final int score;
  final bool result;
  const Game({
    required this.questionIndex,
    required this.checkAnswer,
    required this.nextQuestion,
    required this.score,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            questionAnswer[questionIndex].question,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            var ans = questionAnswer[questionIndex].answer;
            return Padding(
              padding: const EdgeInsets.only(
                top: 7.0,
                left: 60,
                right: 60,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  checkAnswer(questionIndex, index);
                  nextQuestion();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ans[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 6),
        Align(
          alignment: Alignment.center,
          child: Text(
            score.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width / 2,
              color: score > 3 ? Colors.greenAccent : Colors.redAccent,
            ),
          ],
        )
      ],
    );
  }
}
