import 'package:flutter/material.dart';

class Styles {
  static navBarTextStyle(Color warna) {
    return TextStyle(
        fontSize: 22.0,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'FormulaCond',
        color: warna);
  }

  static const boxColTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
      fontFamily: 'PlayfairDisplay');

  static const wTitleTextStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: 'OregonLDO',
  );

  static const parTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'FreeSerif',
  );

  static const boxColShdStyle = BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 7,
      spreadRadius: -5,
      color: Colors.black26);

  static const boxCardShdStyle = BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 2,
      spreadRadius: 2,
      color: Color(0xFFDADADA));

  static const btnTextStyle = TextStyle(
    fontSize: 17.0,
    color: Colors.white,
    fontFamily: 'OregonLDO',
  );

  static const bTitleTextStyle = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.black45,
      fontFamily: 'formulaCond');

  static btnRaisedStyle<Widget>(
      {Color warna, String title, Function eventBtn, Icon iconBtn}) {
    if (iconBtn == null) {
      return RaisedButton(
        onPressed: eventBtn,
        child: Text(title, style: Styles.btnTextStyle),
        color: warna,
        elevation: 0.0,
        hoverElevation: 0.0,
      );
    }
    return RaisedButton.icon(
      onPressed: eventBtn,
      icon: iconBtn,
      label: Text(title, style: Styles.btnTextStyle),
      color: warna,
      elevation: 0.0,
      highlightElevation: 0.0,
    );
  }
}
