import 'package:flutter/material.dart';

class Grid2 extends StatelessWidget {
  const Grid2({Key key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    final devWidth = MediaQuery.of(context).size.width;
    final pdBtm = MediaQuery.of(context).padding.bottom;
    final pdTop = MediaQuery.of(context).padding.top;
    final devheight = MediaQuery.of(context).size.height
                      -kToolbarHeight-pdBtm-pdTop-kTextTabBarHeight;
    return Container(
      child:GridView.count(
        crossAxisCount: 2,
        childAspectRatio:devWidth/devheight,
        children: <Widget>[
          cardItem("Statistik", Icons.graphic_eq),
          cardItem("Data", Icons.date_range),
          cardItem("Notifikasi", Icons.notifications_none),
          cardItem("Profil", Icons.person_outline),
        ],
      ),
    );
  }
  Widget cardItem(String title, IconData icon) {
    return Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(color: Colors.yellow[100]),
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
    );
  }
}
// rafikbojes, 08:00 AM 23/06/2020