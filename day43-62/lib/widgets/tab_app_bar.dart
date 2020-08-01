import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';

class TabAppBar extends StatelessWidget with PreferredSizeWidget {
  TabAppBar({Key key, this.title, this.tipe}) : super(key: key);
  final String title;
  final String tipe;

  final List<Widget> menuNav = [
    RawMaterialButton(
      onPressed: () {},
      elevation: 0.0,
      highlightElevation: 0.0,
      hoverElevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 40, minWidth: 40),
      fillColor: AppColors.green3,
      child: Icon(
        Icons.store,
        color: Colors.white,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    Function checkTipePage =
        (cond1, cond2) => this.tipe == 'home' ? cond1 : cond2;

    return AppBar(
      backgroundColor: checkTipePage(AppColors.green1, AppColors.green3),
      elevation: 0.0,
      title: Text(this.title,
          style: Styles.navBarTextStyle(
              checkTipePage(AppColors.green3, Colors.white))),
      centerTitle: checkTipePage(false, true),
      actions: checkTipePage(menuNav, null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
