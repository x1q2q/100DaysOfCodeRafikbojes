import 'dart:async';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as en_words;
// use for streamController

class Data {
  final String msg;
  final DateTime timestamp;
  Data({@required this.msg, @required this.timestamp});
}

class RandomData extends StatefulWidget {
  @override
  _RandomDataState createState() => _RandomDataState();
}

class _RandomDataState extends State<RandomData> {
  final _inStreamCtrl = StreamController<Data>();
  final _outStreamCtrl = StreamController<Widget>();

  @override
  void initState() {
    super.initState();
    void onData(Data data) {
      final widgetToRender = ListTile(
        title: Text(data.msg),
        subtitle: Text(data.timestamp.toString()),
      );
      _outStreamCtrl.sink.add(widgetToRender);
    }

    _inStreamCtrl.stream.listen(onData);
  }

  Widget _randomdataapp() {
    return Column(children: <Widget>[
      Card(
          child: StreamBuilder<Widget>(
        stream: _outStreamCtrl.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return ListTile(
              leading: CircularProgressIndicator(),
              title: Text('no data found'),
            );
          }
          final Widget widgetToRender = snapshot.data;
          return widgetToRender;
        },
      )),
      SizedBox(
        height: 10,
      ),
      RaisedButton(
        color: Colors.blue[700],
        child: Text('AMBIL DATA', style: TextStyle(color: Colors.white)),
        onPressed: () => this._inStreamCtrl.sink.add(Data(
            msg: en_words.WordPair.random().asPascalCase,
            timestamp: DateTime.now())),
      ),
    ]);
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
                child:
                    Text('2.) RandomData for StreamController implementation',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ))),
            Container(
              color: Colors.lightBlue[50],
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: _randomdataapp(),
            ),
          ]),
    );
  }

  @override
  void dispose() {
    _inStreamCtrl.close();
    _outStreamCtrl.close();
    super.dispose();
  }
}
// rafikbojes, 11:18 PM 30/06/2020
