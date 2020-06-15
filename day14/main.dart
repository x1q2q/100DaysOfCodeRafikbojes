import 'package:flutter/material.dart';
import 'package:arkipelago_dev/pages/profil.dart';
import 'package:arkipelago_dev/pages/home.dart';
import 'package:arkipelago_dev/pages/notifikasi.dart';

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
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      routes: {
        '/':(context) => Home(),
        '/home':(context) => Home(),
        '/profil': (context) => Profil(),
        '/notifikasi': (context) => Notifikasi(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}