import 'package:flutter/material.dart';

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
  List<Widget> scoreIcon = [
    const Icon(
      Icons.check,
      color: Colors.green,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //? Quetions
          const Expanded(
            flex: 4,
            child: Center(
              child: Text(
                "This is quetions....",
                style: TextStyle(color: Colors.white),
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
                  setState(() {
                    scoreIcon.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
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
                onPressed: () {},
                child: const Text(
                  "False",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: const Size(double.infinity, 40)),
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
