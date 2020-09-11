import 'package:flutter/material.dart';

class Styles {
  static lgTxtStyle(Color warna) {
    return TextStyle(
        fontSize: 43.0,
        fontWeight: FontWeight.w800,
        fontFamily: 'Cabin',
        color: warna);
  }

  static const parTxtStyle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black54);
  static const navTxtStyle = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Nunito',
      color: Colors.white);

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
  static const boxLoginShdStyle = BoxShadow(
      offset: Offset(0, 5),
      blurRadius: 2,
      spreadRadius: 4,
      color: Color(0xFFDADADA));

  static const btnTxtStyle = TextStyle(
    fontSize: 15.0,
    color: Colors.white,
    fontFamily: 'Nunito',
  );

  static const bTitleTxtStyle = TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: Colors.black45,
      fontFamily: 'Cabin');

  static const midTitleTxtStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black45,
      fontFamily: 'Cabin');

  static contTxtStyle(Color warna) {
    return TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cabin',
        color: warna);
  }

  static btnRaisedStyle<Widget>(
      {Color warna, String txt, Function func, IconData icon, double rnd}) {
    if (icon != null) {
      return RaisedButton.icon(
          icon: Icon(icon, color: Colors.white),
          label: Text(txt, style: btnTxtStyle),
          onPressed: func,
          color: warna,
          highlightElevation: 0.5,
          elevation: 0.2,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(rnd)));
    }
    return RaisedButton(
        child: Text(txt, style: btnTxtStyle),
        onPressed: func,
        color: warna,
        highlightElevation: 0.5,
        elevation: 0.2,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(rnd)));
  }
}
