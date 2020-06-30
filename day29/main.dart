import 'package:flutter/material.dart';
import 'page11/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//rafikbojes, 11:15 PM 29/06/2020
