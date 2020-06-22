import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget myWidget(double deviceWidth){
    return Stack(
      alignment:AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          height: 100,
          width: deviceWidth,
          color: Colors.teal[200],
        ),
        ClipRRect(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40)),
            child: Container(
              width:0.85*deviceWidth,
              height: 70,
              color: Colors.white38,
            )
        ),
        Positioned.fill(     
          child: Align(
            alignment:Alignment.bottomCenter,
            child: RawMaterialButton(
              fillColor: Colors.purple[600],
              onPressed: (){},
              shape: CircleBorder(),
              elevation:0.5,
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                size: 40.0,
                color: Colors.white,
              )),
          ),
          bottom: 0.0,
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.6,
          backgroundColor: Colors.teal[600],
        ),
        body:  Container(
            child: Column(
              children: <Widget>[
                myWidget(devWidth),
                Container(
                  margin: EdgeInsets.all(8.0),
                  width: devWidth,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      offset: Offset(1.0,0.2),
                      blurRadius: 1.5,
                    ),]
                  ),
                )
              ]),        
          )       
    );
  }
}
// rafikbojes, 11:10 PM 22/06/2020