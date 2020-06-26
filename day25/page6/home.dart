import 'package:flutter/material.dart';
import 'login.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.6,
          backgroundColor: Colors.blueAccent,
        ),
        body:Login(),       
    );
  }
}