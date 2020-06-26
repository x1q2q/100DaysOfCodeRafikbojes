import 'package:flutter/material.dart';
import '../page5/registrasi.dart';
import '../page6/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;

  final tabPages = <Widget>[
    Registrasi(),
    Login()
  ];
  final bottomNavbarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.note_add),
      title:Text('Daftar')
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.lock),
      title:Text('Masuk')
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter Widget'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.green[400],
      ),
      body:tabPages[this.currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items:bottomNavbarItem,
        onTap: (int index){
          setState(()=> this.currentTabIndex = index);
        },
      ),
    );
  }
}