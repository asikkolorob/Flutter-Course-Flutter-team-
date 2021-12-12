import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main_quiz.dart';

MainQuize mainQuize = MainQuize();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
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
    bool? currectAnswer = mainQuize.currectAnswer();
    setState(() {
      if (mainQuize.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        mainQuize.reset();

        scoreIcon = [];
      } else {
        if (userPickedAnswer == currectAnswer) {
          scoreIcon.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: const Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.teal,
                ),
              ),
            ),
          );
        } else {
          scoreIcon.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: const Icon(
                  Icons.close,
                  size: 50,
                  color: Colors.teal,
                ),
              ),
            ),
          );
        }
        mainQuize.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("Quize App"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background.jpg"),
        )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //? Quetions
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  child: Text(
                    mainQuize.getQuetions().toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //? Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size(double.infinity, 60),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size(double.infinity, 60),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //? Result
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
