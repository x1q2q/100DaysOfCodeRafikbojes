  
import 'package:flutter/material.dart';
import 'home3.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.brown,
      ),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      home: Home3(),
      debugShowCheckedModeBanner: false,
    );
  }
}