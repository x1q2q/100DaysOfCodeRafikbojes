import 'package:flutter/material.dart';

class LowlevelAnimasi extends StatefulWidget {
  @override
  _LowlevelAnimasiState createState() => _LowlevelAnimasiState();
}

class _LowlevelAnimasiState extends State<LowlevelAnimasi>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimasi;
  Animation<Color> _colorAnimasi;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    this._curve =
        CurvedAnimation(parent: this._controller, curve: Curves.easeIn);
    this._sizeAnimasi = Tween<double>(begin: 60, end: 120).animate(this._curve);
    this._colorAnimasi =
        ColorTween(begin: Colors.orange[100], end: Colors.orange[700])
            .animate(this._curve);
    this._controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        child: FlutterLogo(),
        height: this._sizeAnimasi.value,
        width: this._sizeAnimasi.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: this._colorAnimasi.value,
        ),
      ),
      RaisedButton(
          color: Colors.teal[700],
          elevation: 0.3,
          child: Text('Animasi Forward', style: TextStyle(color: Colors.white)),
          onPressed: this._controller.isCompleted
              ? null
              : () => _controller.forward()),
      RaisedButton(
          color: Colors.teal[700],
          elevation: 0.3,
          child: Text('Animasi Reverse', style: TextStyle(color: Colors.white)),
          onPressed: this._controller.isDismissed
              ? null
              : () => _controller.reverse()),
      OutlineButton.icon(
        icon: Icon(Icons.loop),
        label: Text('Animasi Berulang'),
        onPressed: () {
          this._controller.addStatusListener((status) {
            if (status == AnimationStatus.completed) this._controller.reverse();
            if (status == AnimationStatus.dismissed) this._controller.forward();
          });
          this._controller.forward();
        },
      )
    ]);
  }
}
// rafikbojes, 10:54 03/07/2020
