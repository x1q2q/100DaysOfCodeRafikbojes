import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: SafeArea(
        child: Container(
          child:Center(
            child: Text('Ini halaman notifikasi!', 
            style:TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold)
            ),
          ),
        ),
      ),
    );
  }
}