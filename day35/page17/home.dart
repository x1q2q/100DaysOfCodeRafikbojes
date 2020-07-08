import 'package:flutter/material.dart';
import 'local_filerw.dart';
import 'shared_pref.dart';

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
        backgroundColor: Colors.pink[800],
      ),
      body: SharedPref(),
    );
  }
}
// rafikbojes, 2:23 PM 08/07/2020
