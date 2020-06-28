import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget'),
        centerTitle: true,
        elevation: 0.4,
        backgroundColor: Colors.orange,
      ),
      body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Card(
              margin: EdgeInsets.all(8),
              color: Colors.orange[100],
              elevation: 0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Contoh Animasi1',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ))),
                    Container(
                      color: Colors.orange[50],
                      height: 100,
                      child: Wrap(
                        children: <Widget>[
                          GestureDetector(
                              child: AnimatedOpacity(
                                duration: Duration(seconds: 1),
                                opacity: this.opacity,
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.red[300],
                                ),
                              ),
                              onTap: () {
                                setState(
                                    () => this.opacity = 1.0 - this.opacity);
                              }),
                        ],
                      ),
                    ),
                  ]),
            )
          ])),
    );
  }
}
