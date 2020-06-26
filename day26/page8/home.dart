import 'package:flutter/material.dart';
import 'my_expansion_tile.dart';
import 'swipe_to_dismiss.dart';
import 'reorderable_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabCtrl;
  void initState(){
    tabCtrl = TabController(length: 3,vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter Widget'),
        elevation:0.5,
        centerTitle:true,
        backgroundColor: Colors.orange[200]
      ),
      body: TabBarView(
        controller: tabCtrl,
        children: [
          MyExpansionTile(),
          SwipeToDismiss(),
          ReorderableList()
        ]
      ),
      bottomNavigationBar: TabBar(
        controller: tabCtrl,
        tabs: [
          Tab(text: 'Expansion Tile'),
          Tab(text: 'Swipe to Dismiss'),
          Tab(text: 'Reorderable List'),
        ],
        onTap: (int index){},
      ),
    );
  }
}