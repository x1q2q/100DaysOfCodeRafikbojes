import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'sending_data.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    this._tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.purple[400],
        bottom: TabBar(
            controller: _tabCtrl,
            tabs: [Tab(text: 'Fetching Data'), Tab(text: 'Sending Data')]),
      ),
      body: TabBarView(
          controller: _tabCtrl, children: <Widget>[FetchData(), SendingData()]),
    );
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }
}
