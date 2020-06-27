import 'package:flutter/material.dart';
import 'sliverapp.dart';
import 'backdrop.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter Widget'),
        elevation:0.5,
        centerTitle:true,
        backgroundColor: Colors.blue[700]
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton.icon(
              onPressed: (){
                Navigator.push(context,Sliverapp());
              }, 
              icon: Icon(Icons.navigate_next), 
              label: Text('Open SliverBar'))
          ],
        ),
      )
    );
  }
}