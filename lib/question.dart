class Question {
  final String question;
  final List answer;
  // ignore: non_constant_identifier_names
  final int correct_answer;
  Question(
      {required this.answer,
      required this.question,
      // ignore: non_constant_identifier_names
      required this.correct_answer});
}

class Answer {
  final String answer;
  Answer({required this.answer});
}

List<Question> questionAnswer = questionAnswerData
    .map(
      (question) => Question(
          answer: question["answer"],
          question: question["question"],
          correct_answer: int.parse(question["correct_answer"])),
    )
    .toList();

// List<Question> asnwer = [
//   Question(answer: [
//     "one",
//     "two",
//     "three",
//     "four",
//   ], question: "this is one", correct_answer: 0)
//];
// Map map = {
//   "genres": [
//     "one",
//     "two",
//     "three",
//     "four",
//     "five",
//   ]
// };

// List<String> json = List<String>.from(map["genres"]);

List questionAnswerData = [
  {
    "question": "What is the most common colour of toilet paper in France?",
    "answer": [
      "Green",
      "Pink",
      "White",
      "Red",
    ],
    "correct_answer": "1",
  },
  {
    "question": "The average person does what thirteen times a day?",
    "answer": [
      "You know this option 🤣",
      "Handshake",
      "Laughs",
      "Running",
    ],
    "correct_answer": "2",
  },
  {
    "question": "Which bird is nicknamed The Laughing Jackass?",
    "answer": [
      "Ostrich",
      "KingFisher",
      "Kookaburra",
      "Peaccok",
    ],
    "correct_answer": "2",
  },
  {
    "question": "Who invented the word vomit?",
    "answer": [
      "William Shakespeare",
      "Plato",
      "Laxmi Prasad Devkota",
      "No One",
    ],
    "correct_answer": "0",
  },
  {
    "question": " Coprastastaphobia is the fear of what?",
    "answer": [
      "Breathing",
      "HandShake",
      "Coughing",
      "Constipation",
    ],
    "correct_answer": "3",
  },
  {
    "question":
        "Who entered a contest to find his own look-alike and came 3rd?",
    "answer": [
      "Michael Jackson",
      "Charlie Chaplin",
      "J.F. Kennedy",
      "William Shakespeare",
    ],
    "correct_answer": "1",
  },
  {
    "question":
        "If you dug a hole through the centre of the earth starting from Wellington in New Zealand, which European country would you end up in?",
    "answer": [
      "Spain",
      "England",
      "Italy",
      "Japan",
    ],
    "correct_answer": "1",
  }
];
