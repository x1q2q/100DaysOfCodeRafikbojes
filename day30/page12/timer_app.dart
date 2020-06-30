import 'dart:async';
import 'package:flutter/material.dart';
// use for streamBuilder

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _timerVal = 0;
  bool _paused = false;

  final Stream<int> _periodicStream =
      Stream.periodic(Duration(milliseconds: 1000), (i) => i);

  int _prevStreamVal = 0;

  Widget _timerapp() {
    return Column(
      children: <Widget>[
        Text('$_timerVal', style: TextStyle(fontSize: 40.0)),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton.icon(
              onPressed: () => setState(() => this._paused = !this._paused),
              icon: Icon(this._paused ? Icons.play_arrow : Icons.pause),
              label: Text(this._paused ? 'Lanjutkan' : 'Jeda'),
            ),
            OutlineButton.icon(
              onPressed: () => setState(() {
                this._timerVal = 0;
                this._paused = true;
              }),
              icon: Icon(Icons.stop),
              label: Text('Stop'),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.blue[200],
      elevation: 0.5,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('1.) TimerApp for StreamBuilder implementation',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ))),
            Container(
              color: Colors.lightBlue[50],
              margin: EdgeInsets.all(5),
              child: StreamBuilder(
                stream: this._periodicStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.data != this._prevStreamVal) {
                    this._prevStreamVal = snapshot.data;
                    if (!_paused) this._timerVal++;
                  }
                  return _timerapp();
                },
              ),
            ),
          ]),
    );
  }
}

// rafikbojes, 11:18 PM 30/06/2020
