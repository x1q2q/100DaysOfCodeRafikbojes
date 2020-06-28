import 'package:flutter/material.dart';

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
        backgroundColor: Colors.purple[700]
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context,'/backdropbar');
              }, 
              elevation: 0,
              icon: Icon(Icons.list), 
              label: Text('Open BackdropBar'),
              color: Colors.purple[100],
            ),
            RaisedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context,'/sliverbar');
              }, 
              elevation: 0.3,
              icon: Icon(Icons.scatter_plot,color:Colors.white), 
              label: Text('Open SliverBar',style:TextStyle(color:Colors.white)),
              color: Colors.purple[300],
            ),
          ],
        ),
      )
    );
  }
}
// rafikbojes, 10:30 PM 28/06/2020