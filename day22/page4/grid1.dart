import 'package:flutter/material.dart';

class Grid1 extends StatelessWidget {
  const Grid1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
      child:GridView.count(
        crossAxisCount: 2,
        childAspectRatio:4/3,
        children: <Widget>[
          cardItem("Statistik", Icons.graphic_eq),
          cardItem("Data", Icons.date_range),
          cardItem("Notifikasi", Icons.notifications_none),
          cardItem("Profil", Icons.person_outline),
        ],
      ),
    );
  }
  Card cardItem(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Container(
        decoration: BoxDecoration(color: Colors.pink[50]),
        child: new InkWell(
          onTap: () {},
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Icon(icon,size: 40.0,color: Colors.black38),
                Text(title,style: 
                  TextStyle(fontSize: 18.0, color: Colors.black45)),
              ],
            ),
          ),
        ),
      )
    );
  }
}
// rafikbojes, 08:00 AM 23/06/2020