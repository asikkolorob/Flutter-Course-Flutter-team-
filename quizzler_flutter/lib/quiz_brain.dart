import 'quetions.dart';

class Quizbrain {
  int _quetionsNumber = 0;
  final List<Question> _questionsBank = [
    Question(
      questionText: 'You can lead a cow down stairs but not up stairs.',
      questionAnswer: false,
    ),
    Question(
        questionText: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true)
  ];

  void nextQuestion() {
    if (_quetionsNumber < _questionsBank.length - 1) {
      _quetionsNumber++;
    } else {}
  }

  String? getQuestions() {
    return _questionsBank[_quetionsNumber].questionText;
  }

  bool? currectAnswer() {
    return _questionsBank[_quetionsNumber].questionAnswer;
  }

  

  bool? isFinished() {
    if (_quetionsNumber >= _questionsBank.length - 1) {
      // ignore: avoid_print
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  
  void reset() {
    _quetionsNumber = 0;
  }
}
