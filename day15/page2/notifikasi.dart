import 'package:arkipelago_dev/page2/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:arkipelago_dev/page2/user_card.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  List<User> dataJson = [
    // User(id: 1,userid: 2,title: 'halahg',body: 'lorem pipsum dolor'),
  ];
  List dataNew = [];
  void getData() async{
    Response resp = await get('https://jsonplaceholder.typicode.com/posts?userId=1');
    // List data = jsonDecode(resp.body);
    var detail = jsonDecode(resp.body);
    dataNew.add(detail);
    for(int i=0;i<dataNew[0].length;i++){
      dataJson.add(User(
        id:dataNew[0][i]['id'],
        userId:dataNew[0][i]['userId'],
        title:dataNew[0][i]['title'],
        body:dataNew[0][i]['body']
      ));
    }    
  }
  @override
  void initState(){ // function yang dijalankan pertama kali ketika meload class ini
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: SafeArea(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: dataJson.map((dt) => UserCard(
              user: dt,
              delete:(){
                setState(() {
                  dataJson.remove(dt);
                }); 
              }
            )).toList(),
          ),
        ),
      ),
    );
  }
}
// rafikbojes, 05:00 AM, 16/06/2020