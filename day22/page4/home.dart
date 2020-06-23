import 'package:flutter/material.dart';
import 'grid1.dart';
import 'grid2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState(){
    tabController = TabController(length: 2,vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.pinkAccent,
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(text:'Grid1'),
              Tab(text:'Grid2'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Grid1(),
            Grid2()
          ],
        ),
      ),
    );
  }
}
// rafikbojes, 08:00 AM 23/06/2020