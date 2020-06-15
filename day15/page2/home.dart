import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override
  void initState(){
    super.initState(); // memanggil method initState pada parent-class
    print('initstate telah dijalankan'); // agar telihat
  }

  @override
  int hitung =0;
  Widget build(BuildContext context) {
    
    print('build funtion telah dijalankan');
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/notifikasi');
                },
                icon:Icon(Icons.notifications_active),
                label:Text('Notifikasi Page'),
              ),
              OutlineButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/profil');
                }, 
                icon: Icon(Icons.supervised_user_circle), 
                label: Text('Profil Page'),
              ),
              FlatButton(
                onPressed: (){
                  setState(() {
                    hitung++;
                  });
                }, 
                child: Text('Penghitung ke-$hitung'),
                color: Colors.teal[100]
              )
            ],
          ),
        ),
      ),
    );
  } 
}
// rafikbojes, 07:33 PM, 15/06/2020