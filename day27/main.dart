import 'package:flutter/material.dart';
import 'page9/home.dart';
import 'page9/backdropbar.dart';
import 'page9/sliverbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/':(context) => Home(),
        '/backdropbar':(context) => Backdropbar(),
        '/sliverbar':(context) => Sliverbar()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
// rafikbojes, 10:30 PM 28/06/2020