import 'package:flutter/material.dart';
import '../config/Configs.dart';

class ContWidgets extends StatelessWidget {
  const ContWidgets({Key key, this.ttlCont, this.boxCont}) : super(key: key);
  final String ttlCont;
  final Widget boxCont;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ttlCont != ''
              ? Text(ttlCont, style: Styles.contTxtStyle(Colors.black38))
              : SizedBox(),
          ttlCont != ''
              ? Divider(thickness: 0.35, color: Colors.black45)
              : SizedBox(),
          CardWidget(wBoxCont: this.boxCont)
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key key, this.wBoxCont}) : super(key: key);
  final Widget wBoxCont;
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(0),
        child: Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [Styles.boxCardShdStyle]),
            child: wBoxCont));
  }
}
