import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzer());
}

class Quizzer extends StatelessWidget {
  const Quizzer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade900,
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
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQText(),
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
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text('True'),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text('False'),
              onPressed: () {
                checkAnswer(false);
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
  void checkAnswer(bool userPickedAnswer)
  {
    if ( !gameOver() )
    {
      if ( quizBrain.getQAnswer() == userPickedAnswer )
      {
        scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green.shade600,
            )
        );
      }
      else
      {
        scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red.shade600,
            )
        );
      }
    }
    setState(() {
      quizBrain.nextQ();
    });
  }
  bool gameOver()
  {
    if( quizBrain.isDone() )
    {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Game Over",
        desc: "Game will be reset, Well done!.",
        buttons: [
          DialogButton(
            child: Text(
              "ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: ()
            {
              setState(() {
                quizBrain.resetGame();
                scoreKeeper.clear();
                Navigator.pop(context);
              });
            },
            color: Colors.blue.shade900,
            width: 120,
          )
        ],
      ).show();
      return true;
    }
    return false;
  }
}
