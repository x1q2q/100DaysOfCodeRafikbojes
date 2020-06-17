import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DaftarBarang extends StatefulWidget {
  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("List Barang"),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
      ),
      body: Center(
          child:SpinKitThreeBounce(
            color: Colors.indigo[500],
            size: 50.0,
          ),
        ),
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020