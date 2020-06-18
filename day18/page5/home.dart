import 'package:flutter/material.dart';
import '../page5/tambah_notes.dart';
import '../page5/daftar_notes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState(){
    controller = TabController(vsync: this,length: 2);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Beginner'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.green[500],
        bottom: TabBar(
          controller: controller,
          tabs: [Tab(text: 'Tambah Notes'),
            Tab(text: 'List Notes')],
        ),
      ),
      body:TabBarView(
        controller: controller,
        children: [
          TambahNotes(),
          DaftarNotes()
        ],
      ),
    );
  }
}