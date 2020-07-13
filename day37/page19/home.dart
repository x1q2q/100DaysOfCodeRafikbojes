import 'package:flutter/material.dart';
import 'hive_contoh.dart';

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
        backgroundColor: Colors.blue[700],
      ),
      body: HiveContoh(),
    );
  }
}
