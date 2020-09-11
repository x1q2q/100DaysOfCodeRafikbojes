import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../screens/paketan_detail.dart';
import '../models/pktn_allpaketan.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../widgets/Widgets.dart';
import '../services/hitung_paketan.dart';

class KategoriDetail extends StatefulWidget {
  final Map<String, dynamic> detailKat;

  KategoriDetail({this.detailKat});

  @override
  _KategoriDetailState createState() => _KategoriDetailState();
}

class _KategoriDetailState extends State<KategoriDetail> {
  final HitungPaketan htPaketan = HitungPaketan();
  Future<List<PktnAllpaketan>> futureListpktn;
  List<PktnAllpaketan> dtListPktn;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  Map<String, dynamic> dataWhere = {};
  @override
  void initState() {
    super.initState();
    this.dataWhere = {'param': 'id_kat', 'where': widget.detailKat['idKat']};
    this.futureListpktn = htPaketan.getPaketan('detail', dataWhere);
  }

  void _updateUI() async {
    setState(() {
      this.futureListpktn = htPaketan.getPaketan('detail', dataWhere);
    });
  }

  Widget colInput(String cText, Widget wInput) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: new Text(cText, style: Styles.parTxtStyle)),
          wInput
        ],
      ),
    );
  }

  Widget detailKat(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple[100], boxShadow: [Styles.boxCardShdStyle]),
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Text(widget.detailKat['kategori'].toUpperCase(),
                        style: Styles.bTitleTxtStyle),
                    Divider(height: 25, thickness: 1.8, color: Colors.black38),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.add_comment, color: Colors.black38),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text(widget.detailKat['detail'],
                                  style: Styles.parTxtStyle)),
                        ])
                  ])),
              ClipOval(
                  child: Container(
                      color: Colors.black38,
                      height: 90,
                      width: 90,
                      child: Center(
                          child: Text(
                        widget.detailKat['kategori']
                            .substring(0, 2)
                            .toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      )))),
            ],
          ),
        ],
      ),
    );
  }

  Widget strikeLine() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Divider(thickness: 5, color: Colors.black38));
  }

  Widget listPaketan(BuildContext ctx) {
    return Container(
        child: FutureBuilder<List<PktnAllpaketan>>(
            future: this.futureListpktn,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtList = snapshot.data;
                dtListPktn = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt: 'Data List Paketan Kosong!',
                  );
                return Column(
                    children: <Widget>[
                  ListTile(
                      tileColor: AppColors.grey1,
                      trailing: Text(
                        'List Paketan (${dtList.length})',
                        style: Styles.bTitleTxtStyle,
                      ),
                      leading: Icon(Icons.card_giftcard, size: 40)),
                ]..add(ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black38,
                          thickness: 0.4,
                        ),
                        itemCount: dtList.length,
                        itemBuilder: (BuildContext context, int id) {
                          Map<String, dynamic> dataPktn = {
                            'idPktn': dtList[id].idPktn,
                            'tgl': DateFormat('yyyy-M-dd')
                                .format(DateTime.now())
                                .toString(),
                          };
                          return Material(
                            child: InkWell(
                              onTap: null,
                              child: ListTile(
                                title: Row(
                                  children: <Widget>[
                                    ClipOval(
                                        child: Container(
                                      width: 32,
                                      height: 32,
                                      color: Colors.purple[100],
                                      child: Center(child: Text("${id + 1}")),
                                    )),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                            dtList[id]
                                                .namaPaketan
                                                .toUpperCase(),
                                            style: Styles.parTxtStyle))
                                  ],
                                ),
                                trailing: Styles.btnRaisedStyle(
                                    warna: AppColors.ungu3,
                                    func: () async {
                                      await Navigator.push(
                                          ctx,
                                          MaterialPageRoute(
                                              builder: (_) => PaketanDetail(
                                                  detailPktn: dataPktn)));
                                    },
                                    txt: 'Detail',
                                    rnd: 20.0),
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      )));
              } else if (snapshot.hasError) {
                return ContImgtxt(
                  img: true,
                  type: 'error-datalist',
                  txt: 'Tidak Dapat Mengambil Data. \n Silakan Refresh Ulang!',
                  loadData: () async {
                    _updateUI();
                  },
                );
              }
              return LoadShimmer(type: 'list', jml: 4);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(tipe: 'kategori-detail', title: 'Detail Kategori'),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async => {},
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(children: <Widget>[
                  this.detailKat(context),
                  this.strikeLine(),
                  ContWidgets(ttlCont: "", boxCont: this.listPaketan(context)),
                ]))));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
