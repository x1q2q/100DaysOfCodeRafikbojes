import 'package:flutter/material.dart';

class Home4 extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home4>{
  void _tambahItem(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding:EdgeInsets.only(top:10.0, right:5.0,left:5.0),
        margin: EdgeInsets.all(10),
        color: Colors.purple[50],
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OutlineButton.icon(
                onPressed: (){},
                color: Colors.deepPurple,
                icon:Icon(Icons.add_shopping_cart),
                label: Text('0 Item',style: TextStyle(
                      color: Colors.deepPurpleAccent
                  ))
            ),
            Text('Jes-Book',style: TextStyle(
              color:Colors.blue[900],
              )
            ),
            RaisedButton(
              onPressed: (){},
              color: Colors.indigo[700],
              child:Text('Tambah Belanjaan?',style: TextStyle(
                color: Colors.white))
            )
          ],
        ),
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahItem,
        icon:Icon(Icons.shop),
        tooltip: 'tambah card',
        label: Text('Beli'),
        
      ),
    );
  } 
}
// rafikbojes, 10:44 PM, 12/06/2020