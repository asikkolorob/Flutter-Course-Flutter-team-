import 'quetions.dart';

class Quizbrain {
  int _quetionsNumber = 0;
  final List<Question> _questionsBank = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
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
}
