import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void funtionsOfCon(int numberOfCon) {
    // ignore: avoid_print
    print("Container $numberOfCon Cliked");
  }

  dynamic buildKey({required Color color, int? printNum}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          funtionsOfCon(printNum!);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.cyan.shade400,
          title: const Text("data"),
        ),
        body: Column(
          children: [
            buildKey(color: Colors.teal, printNum: 1),
            buildKey(color: Colors.red, printNum: 2),
            buildKey(color: Colors.cyan, printNum: 3),
          ],
        ),
      ),
    );
  }
}
