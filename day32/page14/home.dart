import 'package:flutter/material.dart';
import 'putar_video.dart';
// import 'ambil_gambar.dart';

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
      body: PutarVideo(),
      // body: AmbilGambar(),
    );
  }
}
// rafikbojes, 3:07 PM 08/07/2020
