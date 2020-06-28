import 'package:flutter/material.dart';

class Animasi2 extends StatefulWidget {
  @override
  _Animasi2State createState() => _Animasi2State();
}

class _Animasi2State extends State<Animasi2> {
  double opacity1 = 1.0;
  double opacity2 = 1.0;
  double opacity3 = 1.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.orange[100],
      elevation: 0.5,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Opacity Animation',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ))),
            Center(child: Text('Contoh 2, animasi opacity')),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.orange[50],
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      child: Opacity(
                        opacity: this.opacity1,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.orange[300],
                        ),
                      ),
                      onTap: () {
                        setState(() => this.opacity1 = 1.0 - this.opacity1);
                      }),
                  GestureDetector(
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: this.opacity2,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.red[300],
                        ),
                      ),
                      onTap: () {
                        setState(() => this.opacity2 = 1.0 - this.opacity2);
                      }),
                  GestureDetector(
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 2),
                        opacity: this.opacity3,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.teal[300],
                        ),
                      ),
                      onTap: () {
                        setState(() => this.opacity3 = 1.0 - this.opacity3);
                      })
                ],
              ),
            ),
          ]),
    );
  }
}
//rafikbojes, 6:20 AM 29/06/2020
