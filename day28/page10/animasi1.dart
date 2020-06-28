import 'package:flutter/material.dart';

class Animasi1 extends StatefulWidget {
  @override
  _Animasi1State createState() => _Animasi1State();
}

class _Animasi1State extends State<Animasi1> {
  void bukaPageDua(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
              body: Center(
                  child: Hero(
                tag: 'animasi-bojes',
                child: Image.asset('assets/bunga3.png'),
              )),
            )));
  }

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
                child: Text('Hero Animation',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ))),
            Container(
                color: Colors.orange[50],
                margin: EdgeInsets.all(5),
                child: ListTile(
                  leading: GestureDetector(
                    child: Hero(
                        tag: 'animasi-bojes',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/bunga3.png'),
                        )),
                    onTap: () => bukaPageDua(context),
                  ),
                  title: Text('Contoh1, Hero Animasi'),
                )),
          ]),
    );
  }
}
//rafikbojes, 6:20 AM 29/06/2020
