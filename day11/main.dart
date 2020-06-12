  
import 'package:flutter/material.dart';
import 'home4.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      home: Home4(),
      debugShowCheckedModeBanner: false,
    );
  }
}