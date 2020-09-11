import 'package:flutter/material.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({Key key, this.func, this.icon}) : super(key: key);
  final Widget icon;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: func,
      elevation: 0.0,
      highlightElevation: 0.0,
      hoverElevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 40, minWidth: 40),
      fillColor: Colors.white,
      child: icon,
    );
  }
}
