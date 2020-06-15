import 'package:flutter/material.dart';

class About extends StatefulWidget{
  @override
  _AboutState createState() => _AboutState();
}
class _AboutState extends State<About>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: Container(
          child: Text('this is about page!'),
        ),
      ),
    );
  } 
}
// rafikbojes, 10:44 PM, 08/06/2020