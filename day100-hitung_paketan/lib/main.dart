import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung Paketan',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(),
        '/hitung': (context) => Hitung(),
        '/data': (context) => TabStatistik(),
        '/paketan': (context) => Paketan(),
        '/profile': (context) => ProfilUser(),
        '/hitung-confirm': (context) => HitungConfirm()
      },
    );
  }
}
