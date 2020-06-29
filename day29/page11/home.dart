import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final drawHeader = UserAccountsDrawerHeader(
      accountName: Text('Arafik NurF'),
      accountEmail: Text('arafiknurf@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 45.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.orange[500],
        ),
        CircleAvatar(
          child: Text('N'),
          backgroundColor: Colors.teal[500],
        )
      ],
    );
    final drawItem = ListView(
      children: <Widget>[
        drawHeader,
        ListTile(
          title: Text('Go SimpleDialog'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Go TimePickerDialog'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Go DatePickerDialog'),
          onTap: () {},
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: Text('Welcome Drawer'),
      ),
      drawer: Drawer(child: drawItem),
    );
  }
}
