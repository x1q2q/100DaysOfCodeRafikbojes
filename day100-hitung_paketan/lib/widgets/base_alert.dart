import 'package:flutter/material.dart';
import 'package:hitung_paketan/config/Configs.dart';

class BaseAlert extends StatelessWidget {
  const BaseAlert(
      {Key key,
      this.ttl,
      this.content,
      this.yesTxt,
      this.noTxt,
      this.yesBtn,
      this.noBtn})
      : super(key: key);
  final String ttl;
  final Widget content;
  final String yesTxt;
  final String noTxt;
  final Function yesBtn;
  final Function noBtn;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actBtn = [
      if (this.noTxt != "")
        new FlatButton(
          child: Text(this.noTxt),
          textColor: Colors.black54,
          onPressed: () {
            this.noBtn();
          },
        ),
      if (this.yesTxt != "")
        new FlatButton(
          color: AppColors.ungu2,
          child: new Text(this.yesTxt),
          textColor: Colors.white,
          onPressed: () {
            this.yesBtn();
          },
        ),
    ];
    return AlertDialog(
        title: new Text(this.ttl, style: Styles.bTitleTxtStyle),
        content: this.content,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5)),
        actions: actBtn);
  }
}
