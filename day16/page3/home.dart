import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/daftar-laporan');
                },
                icon:Icon(Icons.event_note),
                label:Text('Halaman Laporan'),
              ),
              OutlineButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/daftar-barang');
                }, 
                icon: Icon(Icons.store_mall_directory), 
                label: Text('Halaman Barang'),
              )
            ],
          ),
        ),
      ),
    );
  } 
}
// rafikbojes, 08:00 AM, 17/06/2020