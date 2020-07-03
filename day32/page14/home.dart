import 'package:flutter/material.dart';
// import 'putar_video.dart';
import 'ambil_gambar.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Center(child: Text('Mengambil Gambar')),
            AmbilGambar(),
            Divider(thickness: 10),
            Center(child: Text('Putar Video/Audio Player')),
            // PutarVideo()
          ])),
    );
  }
}
// rafikbojes, 11:18 PM 30/06/2020
