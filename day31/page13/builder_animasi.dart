import 'package:flutter/material.dart';
import 'dart:math';

class BuilderAnimasi extends StatefulWidget {
  @override
  _BuilderAnimasiState createState() => _BuilderAnimasiState();
}

class _BuilderAnimasiState extends State<BuilderAnimasi>
    with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
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
          }),
      RaisedButton(
          color: Colors.blue[700],
          elevation: 0.3,
          child: Text('Animasi Forward', style: TextStyle(color: Colors.white)),
          onPressed: () => _controller.forward()),
      RaisedButton(
          color: Colors.blue[700],
          elevation: 0.3,
          child: Text('Animasi Reverse', style: TextStyle(color: Colors.white)),
          onPressed: () => _controller.reverse()),
    ]);
  }
}
// rafikbojes, 10:54 03/07/2020
