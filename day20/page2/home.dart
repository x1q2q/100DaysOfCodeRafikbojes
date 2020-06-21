import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  bool wrapTrue = true;
  void _changeWrapCondition(){
    setState(() {
      wrapTrue = !wrapTrue;
    });
  }
  Widget withoutWrap(){
    return Row(
      children:<Widget>[
        RaisedButton(child: Text('oke1'),onPressed: (){}),
        RaisedButton(child: Text('oke2'),onPressed: (){}),
        RaisedButton(child: Text('oke3'),onPressed: (){}),
        RaisedButton(child: Text('oke4'),onPressed: (){})
      ]
    );
  }
  Widget withWrap(){
    return Wrap(
      children: <Widget>[
        RaisedButton(child: Text('oke1'),onPressed: (){}),
        RaisedButton(child: Text('oke2'),onPressed: (){}),
        RaisedButton(child: Text('oke3'),onPressed: (){}),
        RaisedButton(child: Text('oke4'),onPressed: (){})
      ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.3,
          backgroundColor: Colors.orange[600],
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: wrapTrue ? withWrap(): withoutWrap(),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeWrapCondition,
          child: Icon(Icons.track_changes),
          tooltip: 'Ubah kondisi wrap',
          backgroundColor: Colors.orange[800],
        ),
    );
  }
}