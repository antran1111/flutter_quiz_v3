import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_bank.dart';

QuizBank quizBank = QuizBank();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),//
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

////
class _QuizPageState extends State<QuizPage> {
  void setIcon(bool c) {
    if (c)
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    else
      scoreKeeper.add(
        Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      );
  }

  void setIconFalse(bool c) {
    if (!c)
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    else
      scoreKeeper.add(
        Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      );
  }

  List<Icon> scoreKeeper = [
    /* Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ), */
  ];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  List<bool> answers = [false, true, true];
//challenge create list of question using the Question and answers
  /*
  Question q1 = Question(
      q: 'You can lead a cow down stairs but not up stairs.', a: false);
  List<Question> questionAnswers = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet', a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];
  */

  //print (q1.questionText);
  //print q1.queestionAnswer);
  //challenge convert list of questions into it's own question class(quiz_brain.dart).

  int questionNumber = 0;
  QuizBank quizQuestions;

  //loop through the quizQuestions
/*
  void loopQuiz(QuizBank quiz) {
    //try loop when they click on it only
    int totalquestions = quiz.allQuestions.length;
    for (int i = 0; i < totalquestions; i++) {
      print(quiz.allQuestions[i]);
    }
  }
*/
  int incrementQuestionNumber(int q) {
    if (q > questions.length - 2) {
      q = 0;
    } else {
      q++;
    }

    return q;
  }

  //try to make it end the game or start over after it reaches last question
  int incrementQuestionNumber2(int q) {
    if (q > quizBank.allQuestions.length - 2) {
      q = 0;
    } else {
      q++;
    }

    return q;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // 'This is where the question text will go.',
                // questions[questionNumber],
                quizBank.allQuestions[questionNumber].myQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.

                // bool correctAnswer = answers[questionNumber];
                bool correctAnswer =
                    quizBank.allQuestions[questionNumber].myAnswer;

                if (correctAnswer == true) {
                  print('user got it right!');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                  //questionNumber = incrementQuestionNumber(questionNumber);
                  questionNumber = incrementQuestionNumber2(questionNumber);
                  print(questionNumber);
                  setIcon(correctAnswer);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // bool correctAnswer = answers[questionNumber];
                bool correctAnswer =
                    quizBank.allQuestions[questionNumber].myAnswer;
                if (correctAnswer == false) {
                  print('user got it right!');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                  questionNumber = incrementQuestionNumber2(questionNumber);
                  print(questionNumber);
                  setIconFalse(correctAnswer);
                });

                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
