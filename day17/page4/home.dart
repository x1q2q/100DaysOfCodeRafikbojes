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
        elevation: 0.3,
        backgroundColor: Colors.lightGreen[400],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/daftar-barang');
                },
                padding: EdgeInsets.all(10.0),
                color:Colors.indigo[400],
                icon: Icon(Icons.store_mall_directory,color: Colors.white), 
                label: Text('Daftar Barang',style:TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  } 
}
// rafikbojes, 2:00 PM 18/06/2020