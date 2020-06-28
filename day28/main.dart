import 'package:flutter/material.dart';
import 'page10/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// rafikbojes, 10:30 PM 28/06/2020
