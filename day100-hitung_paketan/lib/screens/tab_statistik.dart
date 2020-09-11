import 'package:flutter/material.dart';
import '../config/Configs.dart';
import 'statistik.dart';
import 'list_data.dart';

class TabStatistik extends StatefulWidget {
  @override
  _TabStatistikState createState() => _TabStatistikState();
}

class _TabStatistikState extends State<TabStatistik>
    with SingleTickerProviderStateMixin {
  TabController _tabCtrl;
  @override
  void initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: AppBar(
          backgroundColor: AppColors.ungu1,
          elevation: 0.5,
          title: new Text('Statistik', style: Styles.navTxtStyle),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabCtrl,
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(
                icon: Icon(Icons.show_chart),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabCtrl,
          children: [ListData(), Statistik()],
        ));
  }
}
