  
import 'package:flutter/material.dart';
import 'home5.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      home: Home5(),
      debugShowCheckedModeBanner: false,
    );
  }
}