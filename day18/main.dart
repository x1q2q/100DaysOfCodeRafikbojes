import 'package:flutter/material.dart';
import 'page5/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}