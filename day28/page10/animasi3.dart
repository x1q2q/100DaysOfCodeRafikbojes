import 'dart:math';
import 'package:flutter/material.dart';

class Animasi3 extends StatefulWidget {
  @override
  _Animasi3State createState() => _Animasi3State();
}

class _Animasi3State extends State<Animasi3> {
  final rng = Random();
  double height = 40;
  double width = 40;
  double bdRadius = 10;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.orange[100],
      elevation: 0.5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Animated Container',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ))),
        Container(
          padding: EdgeInsets.all(5),
          color: Colors.orange[50],
          height: 140,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedContainer(
              margin: EdgeInsets.all(8),
              child: FlutterLogo(),
              width: this.width,
              height: this.height,
              decoration: BoxDecoration(
                  color: this.color,
                  borderRadius: BorderRadius.circular(this.bdRadius)),
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
            RaisedButton.icon(
              onPressed: () => setState(() {
                // membuat random variable awal
                width = rng.nextInt(50).toDouble() + 10;
                height = rng.nextInt(50).toDouble() + 10;
                bdRadius = rng.nextInt(20).toDouble();
                color = Color.fromRGBO(
                    rng.nextInt(256), rng.nextInt(256), rng.nextInt(256), 1);
              }),
              icon: Icon(Icons.track_changes, color: Colors.white),
              label: Text('Ubah kotak random',
                  style: TextStyle(color: Colors.white)),
              color: Colors.orangeAccent,
              elevation: 0.2,
            )
          ]),
        ),
      ]),
    );
  }
}
//rafikbojes, 6:20 AM 29/06/2020
