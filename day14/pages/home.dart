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
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlineButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/profil');
                }, 
                icon: Icon(Icons.supervised_user_circle), 
                label: Text('Profil Page'),
              ),
              RaisedButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/notifikasi');
                },
                icon:Icon(Icons.notifications_active),
                label:Text('Notifikasi Page'),
              )
            ],
          ),
        ),
      ),
    );
  } 
}
// rafikbojes, 07:33 PM, 15/06/2020