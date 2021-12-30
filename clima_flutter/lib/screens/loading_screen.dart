import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.currentLocation();
  }

  void getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(Uri.parse(url));

    String data = response.body;
    var decodedData = jsonDecode(data);

    int jsonId = decodedData[0]['id'];
    String jsonTitle = decodedData[0]['title'];
    String jsonBody = decodedData[0]['body'];

    print(jsonId);
    print(jsonTitle);
    print(jsonBody);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.teal,
          size: 100.0,
        ),
      ),
    );
  }
}
