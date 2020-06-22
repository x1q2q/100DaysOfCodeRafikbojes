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
      direction: Axis.horizontal,
      children: <Widget>[
        RaisedButton(child: Text('oke1'),onPressed: (){}),
        RaisedButton(child: Text('oke2'),onPressed: (){}),
        RaisedButton(child: Text('oke3'),onPressed: (){}),
        RaisedButton(child: Text('oke4'),onPressed: (){})
      ]
    );
  }
  List<Widget> getLayoutResponsive(){
    return <Widget>[
      Flexible(
        flex:5,
        child: Container(
          color: Colors.red[100]
        )
      ),
      Flexible(
        flex: 5,
        child: Container(
          color: Colors.indigoAccent
        ),
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget',style: 
          TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0.3,
          backgroundColor: Colors.orange[600],
        ),
        body: Center(
            child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey[900],
            width: 300,
            height: 300,
            child: 
              Align(
                alignment: Alignment.bottomRight,
                child: Text('posisi teks',style:
                TextStyle(color: Colors.white,fontSize: 20.0)
              )
            ),
          // child: Padding(
          // padding: EdgeInsets.all(10.0),
          //   child: wrapTrue ? withWrap(): withoutWrap(),
          // ),
            // child: (orientation == Orientation.portrait)?
            // Column(
            //   children: getLayoutResponsive()
            // ):Row(
            //   children: getLayoutResponsive()
            // )
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeWrapCondition,
          child: Icon(Icons.track_changes, color:Colors.white),
          tooltip: 'Ubah kondisi wrap',
          backgroundColor: Colors.orange[800],
        ),
    );
  }
}
// rafikbojes, 5:38 PM, 22/06/2020