import 'package:flutter/material.dart';
import 'page18/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// rafikbojes, 10:39 PM 08/07/2020
