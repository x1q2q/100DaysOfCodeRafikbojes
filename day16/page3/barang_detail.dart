import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class BarangDetail extends StatefulWidget {
  @override
  _BarangDetailState createState() => _BarangDetailState();
}

class _BarangDetailState extends State<BarangDetail> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Barang"),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
      ),
      body: SafeArea(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$data')
            ],
          ),
        ),
      ),
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020