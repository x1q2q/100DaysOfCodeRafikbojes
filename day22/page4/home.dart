import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.6,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
          child:GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              cardItem("Statistik", Icons.graphic_eq),
              cardItem("Data", Icons.date_range),
              cardItem("Notifikasi", Icons.notifications),
              cardItem("Profil", Icons.person_outline),
            ],
          ),
        ),
    );
  }
  Card cardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.pink[50]),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                  child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black38,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black45)),
                )
              ],
            ),
          ),
        ));
  }
}
