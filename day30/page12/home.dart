import 'package:flutter/material.dart';
import 'random_data.dart';
import 'timer_app.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            TimerApp(),
            RandomData(),
          ])),
    );
  }
}
// rafikbojes, 11:18 PM 30/06/2020
