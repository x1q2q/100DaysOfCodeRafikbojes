import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';

class ContainerBoxRadius extends StatelessWidget {
  ContainerBoxRadius({Key key, this.containerPage, this.warna})
      : super(key: key);
  final List<Map<String, dynamic>> containerPage;
  final Color warna;
  Widget _containerBox(String title, Widget boxContainer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title != '' ? SizedBox(height: 5.0) : SizedBox(),
        title != '' ? Text(title, style: Styles.boxColTextStyle) : SizedBox(),
        SizedBox(height: 5),
        boxContainer,
        SizedBox(height: 10),
        title != ''
            ? Divider(thickness: 0.8, color: Colors.black12)
            : SizedBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          color: AppColors.green3,
          height: devHeight * .10,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: warna == null ? Colors.white : warna,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: containerPage
                    .map((e) => _containerBox(e['title'], e['boxWidget']))
                    .toList(),
              )),
        ),
      ],
    );
  }
}
