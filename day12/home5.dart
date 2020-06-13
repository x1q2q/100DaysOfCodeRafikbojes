import 'package:flutter/material.dart';

class Home5 extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home5>{
  bool showCardId = true;
  void _showID(){
    setState(() {
      this.showCardId = !this.showCardId;
    });
  }

  final List<Widget> nonUserCard = [
    SizedBox(height: 20.0),
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child:Text('kotak1'),
          color:Colors.grey,
          padding: EdgeInsets.all(30.0),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child:Text('kotak2'),
            color:Colors.limeAccent,
            padding: EdgeInsets.all(20.0),
          ),
        ),
        Container(
          child:Text('kotak3'),
          color: Colors.lightGreenAccent,
          padding: EdgeInsets.all(30.0),
        )
      ],
    ),
    SizedBox(height:10.0),
    Row(
      children: <Widget>[
        Expanded(
          flex:1,
          child: Container(
            child:Text('1'),
            color:Colors.deepOrangeAccent,
            padding: EdgeInsets.all(30.0),
          ),
        ),
        Expanded(
          flex:2,
          child: Container(
            child:Text('2'),
            color: Colors.yellowAccent,
            padding: EdgeInsets.all(30.0),
          ),
        ),
        Expanded(
          flex:1,
          child: Container(
            child:Text('3'),
            color: Colors.deepPurpleAccent,
            padding: EdgeInsets.all(30.0),
          ),
        )
      ],
    ),
  ];

  final List<Widget> userCard =[
    Center(
      child:CircleAvatar(
        backgroundImage: AssetImage('assets/img3.jpg'),
        radius: 50.0,  
      ),
    ),
    Divider(
      height: 90.0,
      color: Colors.grey[300],
    ),
    Text('NAMA',style: TextStyle(
      fontSize: 16.0,
      color: Colors.teal,
    )),
    Text('Arafik',style: TextStyle(
      fontSize: 20.0
    )),
    SizedBox(height: 10.0),
    Text('DEPARTMENT',style: TextStyle(
      fontSize: 16.0,
      color: Colors.teal,
    )),
    Text('IT Education"19',style: TextStyle(
      fontSize: 20.0
    )),
    SizedBox(height: 10.0),
    SizedBox(height: 10.0,),
    Row(
      children: <Widget>[
        Icon(Icons.email,size:20.0,color:Colors.teal),
        Text('  arafiknurf@student.uns.ac.id',style:TextStyle(
          fontSize: 20.0
        ))
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        elevation: 0.5,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: deviceWidth,
        height: deviceHeight,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.showCardId == true? userCard :nonUserCard,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showID,
        child:Icon(Icons.notifications),
        tooltip: 'notif me',
      ),
    );
  }
}
// rafikbojes, 10:44 PM, 12/06/2020