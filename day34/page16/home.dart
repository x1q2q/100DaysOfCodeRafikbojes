import 'package:flutter/material.dart';
import 'piechart_series.dart';
import 'timechart_series.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.pink[800],
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[TimechartSeries(), PiechartSeries()])),
    );
  }
}
// rafikbojes, 11:18 PM 30/06/2020
