import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';
import 'package:konterapps/widgets/widgets.dart';
import '../data/jenis_barangs.dart';
import '../data/barang_sorotans.dart';

class ListItemScreen extends StatefulWidget {
  @override
  _ListItemScreenState createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  List<Map<String, dynamic>> listItemContainer;
  @override
  void initState() {
    super.initState();
    listItemContainer = [
      {'title': 'Kategori', 'boxWidget': _boxKategori()},
      {'title': 'All Item', 'boxWidget': _boxAllItem()},
    ];
  }

  Widget _boxKategori() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: jenisBarangs.length,
          itemBuilder: (BuildContext context, int id) {
            return Material(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.teal,
              child: InkWell(
                splashColor: AppColors.green3, // inkwell color
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          jenisBarangs[id].jenis,
                          style: Styles.wTitleTextStyle,
                        ),
                        Icon(
                          Icons.calendar_view_day,
                          size: 40,
                          color: Colors.white60,
                        )
                      ],
                    )),
                onTap: () {},
              ),
            );
          }),
    );
  }

  Widget _boxAllItem() {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: barangSorotans.length,
      itemBuilder: (BuildContext ctx, int id) {
        return Material(
            elevation: 0.0,
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.orange[200],
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                height: 120,
                padding: EdgeInsets.all(0),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        boxShadow: [Styles.boxColShdStyle],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        image: DecorationImage(
                            image: AssetImage(barangSorotans[id].image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(barangSorotans[id].nama,
                              style: Styles.bTitleTextStyle),
                          Expanded(child: Text(barangSorotans[id].detail)),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                  barangSorotans[id].stok.toString() + '-stok'),
                              Text('12/07/2020')
                            ],
                          ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabAppBar(
        title: 'List Item',
        tipe: 'listitem',
      ),
      body: SingleChildScrollView(
          child: ContainerBoxRadius(containerPage: listItemContainer)),
    );
  }
}
