import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  String textJson;
  Map body;
  void getData() async{
    Response resp = await get('https://jsonplaceholder.typicode.com/posts');
    this.body =jsonDecode(resp.body); 
  }
  void getJson(){
    setState(() {
      this.textJson = jsonEncode(this.body);
    });
  }
  @override
  void initState(){ // function yang dijalankan pertama kali ketika meload class ini
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: SafeArea(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text('Read JSON'),
                onPressed: getJson,
                color: Colors.teal,
              ),
              Text('${this.textJson}'),
            ],
          ),
        ),
      ),
    );
  }
}