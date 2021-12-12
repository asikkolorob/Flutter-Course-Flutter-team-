import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

Quizbrain quizeBrain = Quizbrain();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreIcon = [];

  void checkAnswer(bool userPickedAnswer) {
    // ignore: unused_local_variable
    bool? currectAnswer = quizeBrain.currectAnswer();
    setState(() {
      if (quizeBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizeBrain.reset();

        scoreIcon = [];
      } else {
        if (userPickedAnswer == currectAnswer) {
          scoreIcon.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreIcon.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizeBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //? Quetions
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  quizeBrain.getQuestions().toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //? Answer Button 1
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  "True",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          //? Answer Button 2
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  "False",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ),
          ),
          //? Result Icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: scoreIcon,
            ),
          )
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
