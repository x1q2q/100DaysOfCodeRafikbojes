import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget helloWidget(){
    return Column(
      children: <Widget>[
        Text('Hello Widget!'),
        Text('Hello Widget!'),
        Text('Hello Widget!'),
        Text('Hello Widget!'),
      ]
    );
  }
  Widget contohRichtext(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child:RichText(text: 
        TextSpan(
          text: 'Rafik',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black45,
          ),
          children: [
            TextSpan(text: ' Bojes',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color:Colors.teal
            )),
            TextSpan(text: ' from PBG')
          ]
        ),
      )
    );
  }
  Widget contohClipRRect(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        // child: Image.asset("assets/img1.jpg"),
        child:Container(
          height: 200,
          width: 200,
          color: Colors.teal
        )
      )
    ); 
  }
  Widget contohSizedbox(){
    return SizedBox(
      width: 180,
      height: 50,
      child: RaisedButton(
        color: Colors.orange[600],
        child: Text('Contoh Button',style:
          TextStyle(color: Colors.white)),
        onPressed: (){},
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea( // penggunaan safeArea
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.3,
          backgroundColor: Colors.yellow[500],
        ),
        body: Container(
          child: Center(
            child: contohSizedbox() ,
          ),
        )
      )
    );
  }
}
// rafikbojes, 2:43 PM, 21/06/2020