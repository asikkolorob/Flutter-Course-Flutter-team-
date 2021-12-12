import 'package:flutter_quiz_prectice/quetions.dart';

class MainQuize {
  int _numberOFQuetion = 0;
  final List<Quetions> _quetionsList = [
    Quetions(
        quetinText: 'Prophet Muhammad is the last Prophet?',
        quetionAnswer: true),
    Quetions(
        quetinText: 'Is prophet Adam the last prophet of islam?',
        quetionAnswer: false),
    Quetions(
        quetinText: 'Do Muslim boys and girls pray together?',
        quetionAnswer: false),
    Quetions(
        quetinText: 'There are 500 pillars of Islam.', quetionAnswer: false),
    Quetions(
        quetinText:
            'Prophet Nuh\'s son protected himself during the flood by going on the ark?',
        quetionAnswer: false),
  ];

  

  void nextQuestion() {
    if (_numberOFQuetion < _quetionsList.length - 1) {
      _numberOFQuetion++;
    } else {}
  }

  String? getQuetions() {
    return _quetionsList[_numberOFQuetion].quetinText;
  }

  bool? answerQuetion() {
    return _quetionsList[_numberOFQuetion].quetionAnswer;
  }

  bool? currectAnswer() {
    return _quetionsList[_numberOFQuetion].quetionAnswer;
  }

  bool? isFinished() {
    if (_numberOFQuetion >= _quetionsList.length - 1) {
      // ignore: avoid_print
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _numberOFQuetion = 0;
  }
}

/*
    "Do Muslim boys and girls pray together?",
    "Prophet Muhammad is the last Prophet?",
    "Is prophet Adam the last prophet of islam?",
    "There are 500 pillars of Islam.",
    "Prophet Nuh's son protected himself during the flood by going on the ark?",
*/
