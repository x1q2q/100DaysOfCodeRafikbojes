import 'package:flutter/material.dart';

class Backdrop extends MaterialPageRoute<Null>{
  Backdrop()
    :super(builder: (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Backdrop page'),
          elevation: 0.3,
        ),
        body:Padding(
          padding: EdgeInsets.all(10.0),
          child:Text('Backdrop'),
        )
      );
    });
  
}