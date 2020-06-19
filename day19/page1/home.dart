import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.yellow[500],
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Hello Widget!'),
                Text('Hello Widget!'),
                Text('Hello Widget!'),
                Text('Hello Widget!'),
              ]),
            )
          )
      )
    );
  }
}