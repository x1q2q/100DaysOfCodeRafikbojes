import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  Widget containerAnimasi() {
    final rotateAnimation =
        Tween<double>(begin: 0, end: pi).animate(this._controller);
    return Column(children: <Widget>[
      AnimatedBuilder(
          animation: rotateAnimation,
          child: FlutterLogo(size: 72.0),
          builder: (context, child) {
            return Transform.rotate(
              angle: rotateAnimation.value,
              child: child,
            );
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Animasi Forward'),
              onPressed: () => _controller.forward()),
          RaisedButton(
              child: Text('Animasi Reverse'),
              onPressed: () => _controller.reverse()),
          containerAnimasi()
        ],
      ),
    );
  }
}
