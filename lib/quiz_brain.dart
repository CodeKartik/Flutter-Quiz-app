import 'package:Quizzler/question.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNo = 0;

  List<Questions> _questionBank = [
    Questions(
        questionText: 'Q.You can lead the cow upstairs but not the downstairs',
        questionAnswer: false),
    Questions(
        questionText: 'Q.The slug\'s blood is green', questionAnswer: true),
    Questions(
        questionText:
            'Q.Approximately one quarter of human bones are in the feet',
        questionAnswer: true),
    Questions(
        questionText: 'Q.You must be motivated while learning new things!',
        questionAnswer: true)
  ];

  void nextquestion() {
    if (_questionNo < _questionBank.length - 1) {
      _questionNo++;
    }
  }

  String getquestiontext() {
    return _questionBank[_questionNo].questionText;
  }

  bool getquestionAnswer() {
    return _questionBank[_questionNo].questionAnswer;
  }

  bool isFinished() {
    if (_questionNo >= _questionBank.length - 1) {
      print('now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNo = 0;
  }
}
