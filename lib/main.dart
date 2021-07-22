import 'package:flutter/material.dart';
import 'package:Quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MaterialApp(
      home: Quizzler(),
    ));

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  void checkAnswers(bool userpickedAnswer) {
    bool correctAnswer = quizBrain.getquestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: 'Finished',
                desc: 'You\'e reached the end of the quiz')
            .show();
        //reset the question no
        quizBrain.reset();
        //emptying the scorekeeper
        scoreKeeper = [];
      } else {
        if (correctAnswer == userpickedAnswer) {
          // print('user got it right');
          setState(() {
            scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          });
        } else {
          // print('user got it wrong');
          setState(() {
            scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          });
        }
        quizBrain.nextquestion();
      }
    });
  }

  // List<String> qusestions = [
  //   'Q.You can lead the cow upstairs but not the downstairs',
  //   'Q.The slug\'s blood is green',
  //   'Q.Approximately one quarter of human bones are in the feet'
  // ];

  // List<bool> amswers = [false, true, true];

  // Questions q1 = Questions(
  //     question: 'Q.You can lead the cow upstairs but not the downstairs',
  //     answer: false);

  // List<Questions> questionBank = [
  //   Questions(
  //       q: 'Q.You can lead the cow upstairs but not the downstairs', a: false),
  //   Questions(q: 'Q.The slug\'s blood is green', a: true),
  //   Questions(
  //       q: 'Q.Approximately one quarter of human bones are in the feet',
  //       a: true),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizBrain.getquestiontext(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(height: 150.0),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    checkAnswers(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  height: 70.0,
                ),
              ),
              // SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 40.0, left: 5.0, right: 5.0),
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    checkAnswers(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  height: 70.0,
                ),
              ),

              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      )),
    );
  }

  // void reset() {
  //   scoreKeeper.remove(true);
  // }
}
