import 'package:flutter/material.dart';
import 'package:quizzler/model/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

class _QuizPageState extends State<QuizPage> {
  QuizzBrain quizzBrain = QuizzBrain();

  void nextQuestion(bool userpicked) {
    bool correctAnswer = quizzBrain.correctAnswer();
    bool ans = true;

    setState(() {
      if (quizzBrain.isFinished() == ans) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Quizzler(),
          ),
        );
        Alert(
            context: context,
            // closeFunction: () => ,
            type: AlertType.success,
            title: 'SUCCESS',
            // onWillPopActive: ture,
            desc: 'You have successfully finished the Quizzler',
            content: Wrap(
              children: [
                Text('1.'),
                scoreKeeper[0],
                Text('2.'),
                scoreKeeper[1],
                Text('3.'),
                scoreKeeper[2],
                Text('4.'),
                scoreKeeper[3],
                Text('5.'),
                scoreKeeper[4],
                Text('6.'),
                scoreKeeper[5],
                Text('7.'),
                scoreKeeper[6],
                Text('8.'),
                scoreKeeper[7],
                Text('9.'),
                scoreKeeper[8],
                Text('10.'),
                scoreKeeper[9],
                Text('11.'),
                scoreKeeper[10],
                Text('12.'),
                scoreKeeper[11],
                Text('13'),
                // scoreKeeper[12],
              ],
            ),
            closeFunction: () {
              Navigator.pop(context);

              scoreKeeper.clear();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Quizzler(),
                ),
              );
            },
            buttons: [
              DialogButton(
                child: Text(
                  'Reset Quizzler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);

                  scoreKeeper.clear();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quizzler(),
                    ),
                  );
                },
              )
            ]).show();
        // scoreKeeper.clear();
      }

      if (userpicked == correctAnswer) {
        dynamic green = Icon(Icons.check, color: Colors.green);
        scoreKeeper.add(green);
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      quizzBrain.nextQuestion();
    });
  }

  List<Icon> scoreKeeper = [];

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
                // questionBank[nextNumber]['text'],
                quizzBrain.getQuestions(),
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
                nextQuestion(true);
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
                //The user picked false.
                nextQuestion(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

class Lastpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
