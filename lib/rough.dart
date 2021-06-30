import 'package:flutter/material.dart';
import 'package:quiz/game.dart';
import 'package:quiz/question.dart';

class QuizGame extends StatefulWidget {
  @override
  _QuizGameState createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  int questionIndex = 0;

  int score = 0;

  bool result = false;

  void nextQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  checkAnswer(int questionIndex, int answerIndex) {
    if (answerIndex == questionAnswer[questionIndex].correct_answer) {
      score++;
      print("correct answer");
    } else {
      result = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Quiz App',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: questionIndex < questionAnswer.length
                ? Game(
                    questionIndex: questionIndex,
                    checkAnswer: checkAnswer,
                    nextQuestion: nextQuestion,
                    score: score,
                    result: result,
                  )
                : Container(
                    child: SizedBox.shrink(),
                  ),
          ),
          questionIndex == questionAnswer.length
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      backgroundColor:
                          score < 3 ? Colors.red : Colors.greenAccent,
                      title: score < 3
                          ? Text(
                              "ALik dherai padney gara IQ badxa",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Saybas, kanxa!!",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      content: Text(
                        "Your score is  " + score.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              score = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Retry",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: SizedBox.shrink(),
                ),
        ],
      ),
    );
  }
}
