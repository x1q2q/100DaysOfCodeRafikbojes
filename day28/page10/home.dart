import 'package:flutter/material.dart';
import 'animasi1.dart';
import 'animasi2.dart';
import 'animasi3.dart';

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
        elevation: 0.4,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[Animasi1(), Animasi2(), Animasi3()])),
    );
  }
}
//rafikbojes, 6:20 AM 29/06/2020
