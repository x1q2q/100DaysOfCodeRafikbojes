import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class Backdropbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar:BackdropAppBar(
        title:Text('Backdrop NavBar'),
      ),
      headerHeight:100.0,
      frontLayer:Center(
        child: Wrap(direction: Axis.vertical,children: <Widget>[
          Text('Demo dari Backdropbar',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 20)),
          Text('thanks fluttercommunity.dev',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black38)),
        ],),
      ),
      backLayer: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/img1.jpg'),
            fit:BoxFit.cover
          ),
        ),
      )
    );
  }
}
// rafikbojes, 10:30 PM 28/06/2020