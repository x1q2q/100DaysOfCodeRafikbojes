import 'package:flutter/material.dart';
import '../config/Configs.dart';

class DefAppBar extends StatelessWidget with PreferredSizeWidget {
  DefAppBar({Key key, this.title, this.tipe, this.actBtn}) : super(key: key);
  final String title;
  final String tipe;
  final List<Widget> actBtn;

  @override
  Widget build(BuildContext context) {
    Function homeCheck = (cond1, cond2) => this.tipe == 'home' ? cond1 : cond2;
    return new AppBar(
      backgroundColor: homeCheck(AppColors.red0, AppColors.ungu1),
      elevation: 0.5,
      title: new Text(title, style: Styles.navTxtStyle),
      centerTitle: homeCheck(false, true),
      actions: actBtn,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
