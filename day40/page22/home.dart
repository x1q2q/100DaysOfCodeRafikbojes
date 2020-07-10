import 'package:flutter/material.dart';
import 'show_page.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.teal[300],
      ),
      body: ShowPage(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text('Add data'),
        icon: Icon(Icons.playlist_add),
      ),
    );
  }
}
