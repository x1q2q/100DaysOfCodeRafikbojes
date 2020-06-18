import 'package:flutter/material.dart';
import 'page4/home.dart';
import 'page4/daftar_barang.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      routes: {
        '/':(context) => Home(),
        '/home':(context) => Home(),
        '/daftar-barang': (context) => DaftarBarang(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}