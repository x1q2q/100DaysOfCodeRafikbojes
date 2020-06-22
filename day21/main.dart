import 'package:flutter/material.dart';
import 'page3/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter widget',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// rafikbojes, 5:38 PM, 22/06/2020