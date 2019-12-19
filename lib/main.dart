import 'package:flutter/material.dart';
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
          ),
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

  void checkAnswer (bool userAnswers,bool correctAnswer) {

    if (userAnswers == correctAnswer) {
      print('user got it right!');
      setIconTrue();
    } else {
      print('user got it wrong');
      setIconFalse2();
    }

    setState(() {
      questionNumber = incrementQuestionNumber2(questionNumber);
      print(questionNumber);
      //setIcon(correctAnswer);
    });

  }
  void setIconTrue() {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
  }

  void setIconFalse2() {
    scoreKeeper.add(
      Icon(
        Icons.delete_forever,
        color: Colors.red,
      ),
    );
  }

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
    //contains list of score icons
  ];

  int questionNumber = 0;

  //try to make it end the game or start over after it reaches last question
  int incrementQuestionNumber2(int q) {
    if (q > quizBank.allQuestions.length - 2) {
      q = 0;
      scoreKeeper.clear();
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
                bool correctAnswer =
                    quizBank.allQuestions[questionNumber].myAnswer;
              checkAnswer(true, correctAnswer);
                /*if (correctAnswer == true) {
                  print('user got it right!');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                  questionNumber = incrementQuestionNumber2(questionNumber);
                  print(questionNumber);
                  setIcon(correctAnswer);
                });*/
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
                checkAnswer(false, correctAnswer); /*
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
*/
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