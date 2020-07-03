import 'package:flutter/material.dart';

class WidgetAnimasi extends StatefulWidget {
  @override
  _WidgetAnimasiState createState() => _WidgetAnimasiState();
}

class _WidgetAnimasiState extends State<WidgetAnimasi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimasi;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    this._sizeAnimasi =
        Tween<double>(begin: 70, end: 140).animate(this._controller);
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _AnimasiLogo(animation: this._sizeAnimasi),
      RaisedButton(
          color: Colors.red[700],
          elevation: 0.3,
          child: Text('Animasi ScaleUp', style: TextStyle(color: Colors.white)),
          onPressed: () => _controller.forward()),
      RaisedButton(
          color: Colors.red[700],
          elevation: 0.3,
          child:
              Text('Animasi ScaleDown', style: TextStyle(color: Colors.white)),
          onPressed: () => _controller.reverse()),
    ]);
  }
}

class _AnimasiLogo extends AnimatedWidget {
  _AnimasiLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final Animation<double> animasi = this.listenable;
    return Center(
        child: Container(
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
            height: animasi.value,
            width: animasi.value));
  }
}

// rafikbojes, 10:54 03/07/2020
