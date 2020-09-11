import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadShimmer extends StatelessWidget {
  const LoadShimmer({Key key, this.type, this.jml}) : super(key: key);
  final String type;
  final int jml;

  Widget shimmDef() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 17.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: jml,
        ));
  }

  Widget shimmList() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                    child: Container(
                  width: 32,
                  height: 32,
                  color: Colors.white,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  height: 25.0,
                  color: Colors.white,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                ),
                Container(
                  width: 50,
                  height: 25.0,
                  color: Colors.white,
                )
              ],
            ),
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: jml,
        ));
  }

  Widget shimmSlide(BuildContext ctx) {
    var devSize = MediaQuery.of(ctx).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: jml,
          itemBuilder: (BuildContext context, int id) {
            return Container(
                margin: EdgeInsets.all(5),
                width: devSize.width / 3.8,
                child: Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                        onTap: () {},
                        child: Padding(padding: EdgeInsets.all(7)))));
          },
        ));
  }

  Widget descCont() {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Chip(avatar: null, backgroundColor: Colors.white, label: Text('')),
          ],
        ));
  }

  Widget shimmPaketan(BuildContext ctx) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
                height: 160,
              ),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: <Widget>[
                  this.descCont(),
                  this.descCont(),
                  this.descCont(),
                  this.descCont(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Divider(thickness: 7, color: Colors.white),
                  )),
              SizedBox(height: 30),
              Container(width: 10, color: Colors.white, height: 30),
              Padding(padding: EdgeInsets.all(15), child: this.shimmList())
            ]));
  }

  Widget getType(BuildContext ctx) {
    switch (this.type) {
      case 'list':
        return shimmList();
        break;

      case 'slide':
        return shimmSlide(ctx);
        break;

      case 'paketan':
        return shimmPaketan(ctx);
        break;

      default:
        return shimmDef();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: getType(context),
    );
  }
}
