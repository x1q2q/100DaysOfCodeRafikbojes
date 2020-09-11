import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/kategori_detail.dart';
import '../screens/paketan_detail.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../services/hitung_paketan.dart';
import '../models/pktn_kategori.dart';
import '../models/pktn_allpaketan.dart';

class Paketan extends StatefulWidget {
  @override
  _PaketanState createState() => _PaketanState();
}

class _PaketanState extends State<Paketan> {
  final HitungPaketan htPaketan = HitungPaketan();
  Future<List<PktnKategori>> futureKategori;
  Future<List<PktnAllpaketan>> futureAllpktn;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<PktnKategori> dtKategori;
  List<PktnAllpaketan> dtAllpktn;
  @override
  void initState() {
    super.initState();
    this.futureKategori = htPaketan.getKategori();
    this.futureAllpktn = htPaketan.getPaketan('all');
  }

  void _updateKat() async {
    setState(() {
      this.futureKategori = htPaketan.getKategori();
    });
  }

  void _updatePktn() async {
    setState(() {
      this.futureAllpktn = htPaketan.getPaketan('all');
    });
  }

  Widget katPaketan(BuildContext ctx, var devSize) {
    return Container(
        height: 135,
        child: FutureBuilder<List<PktnKategori>>(
            future: this.futureKategori,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtList = snapshot.data;
                dtKategori = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt: 'Data List Kategori Kosong!',
                  );
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: dtList.length,
                  itemBuilder: (BuildContext context, int id) {
                    Map<String, dynamic> dataKat = {
                      'idKat': dtList[id].idKat,
                      'kategori': dtList[id].kategori,
                      'detail': dtList[id].detail
                    };
                    return Container(
                        margin: EdgeInsets.all(5),
                        width: devSize.width / 3.8,
                        child: Material(
                            color: Colors.purple[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                      ctx,
                                      MaterialPageRoute(
                                          builder: (_) => KategoriDetail(
                                              detailKat: dataKat)));
                                },
                                splashColor: Colors.purple[500],
                                child: Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Column(children: <Widget>[
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: ClipOval(
                                              child: Material(
                                            color: Colors.white60,
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(Icons.card_giftcard,
                                                    color: AppColors.ungu2)),
                                          ))),
                                      SizedBox(height: 10),
                                      Center(
                                          child: Text(
                                              dtList[id].kategori.toUpperCase(),
                                              style: Styles.contTxtStyle(
                                                  Colors.black45)))
                                    ])))));
                  },
                );
              } else if (snapshot.hasError) {
                return ContImgtxt(
                  type: 'error-datalist',
                  img: false,
                  loadData: () async => _updateKat(),
                  txt: 'Tidak Dapat Mengambil Data. \n Silahkan Refresh Ulang!',
                );
              }

              return LoadShimmer(type: 'slide', jml: 5);
            }));
  }

  Widget allPaketan(BuildContext ctx) {
    return Container(
        child: FutureBuilder<List<PktnAllpaketan>>(
            future: this.futureAllpktn,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtList = snapshot.data;
                dtAllpktn = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt: 'Data List Paketan Kosong!',
                  );
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black45,
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
                        splashColor: AppColors.red2,
                        onTap: null,
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              ClipOval(
                                  child: Container(
                                width: 32,
                                height: 32,
                                color: AppColors.red0,
                                child: Center(child: Text("${id + 1}")),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                      dtList[id].namaPaketan.toUpperCase(),
                                      style: Styles.parTxtStyle))
                            ],
                          ),
                          trailing: Styles.btnRaisedStyle(
                              warna: AppColors.red3,
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
                );
              } else if (snapshot.hasError) {
                return ContImgtxt(
                  img: true,
                  type: 'error-datalist',
                  txt: 'Tidak Dapat Mengambil Data. \n Silakan Refresh Ulang!',
                  loadData: () async {
                    _updatePktn();
                  },
                );
              }
              return LoadShimmer(type: 'list', jml: 6);
            }));
  }

  @override
  Widget build(BuildContext context) {
    var devSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'paketan',
          title: 'Paketan',
          actBtn: null,
        ),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              _updateKat();
              _updatePktn();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ContWidgets(
                    ttlCont: 'KATEGORI PAKETAN',
                    boxCont: this.katPaketan(context, devSize),
                  ),
                  ContWidgets(
                    ttlCont: 'ALL ITEM PAKETAN',
                    boxCont: this.allPaketan(context),
                  ),
                ],
              ),
            )));
  }
}
