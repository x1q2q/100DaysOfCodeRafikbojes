import 'package:flutter/material.dart';
import '../models/stats_allpenjualan.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import 'package:intl/intl.dart';
import '../services/hitung_paketan.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  final HitungPaketan htPaketan = HitungPaketan();
  Future<List<StatsAllpenjualan>> futureAllPnjl;
  List<StatsAllpenjualan> dtAllPnjl;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var tglFormat = DateFormat.yMMMMd();
  @override
  void initState() {
    super.initState();
    this.futureAllPnjl = htPaketan.getAllPenjualan();
  }

  void _updateUI() async {
    setState(() {
      this.futureAllPnjl = htPaketan.getAllPenjualan();
    });
  }

  String cekHari(String tgl) {
    return tgl == Fnc.tglYMD() ? ' (Hari Ini)' : '';
  }

  void _infoSheet(BuildContext ctx, Map<String, dynamic> dt) {
    const boldStyle =
        TextStyle(fontWeight: FontWeight.bold, color: AppColors.ungu3);
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(8),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: <Widget>[
                ListTile(
                  title: Text('Tanggal Penjualan'),
                  dense: false,
                  trailing: Text(dt['tgl'], style: boldStyle),
                ),
                ListTile(
                  title: Text('Total Untung'),
                  dense: false,
                  trailing: Text(dt['totalUntung'], style: boldStyle),
                ),
                ListTile(
                  title: Text('Total Harga Modal'),
                  dense: false,
                  trailing: Text(dt['totalHmodal'], style: boldStyle),
                ),
                ListTile(
                  title: Text('Total Harga Jual'),
                  dense: false,
                  trailing: Text(dt['totalHjual'], style: boldStyle),
                ),
                ListTile(
                  title: Text('Total Terjual'),
                  dense: false,
                  trailing: Text(dt['totalTerjual'] + ' PCS', style: boldStyle),
                )
              ],
            ),
          );
        });
  }

  Widget listPaketan(BuildContext ctx) {
    return Container(
        color: Colors.white,
        child: FutureBuilder<List<StatsAllpenjualan>>(
            future: this.futureAllPnjl,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtList = snapshot.data;
                dtAllPnjl = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt: 'Data List Penjualan Kosong!',
                  );
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black45,
                    thickness: 0.4,
                  ),
                  itemCount: dtAllPnjl.length,
                  itemBuilder: (BuildContext context, int id) {
                    Map<String, dynamic> data = {
                      'id': id + 1,
                      'tgl': dtList[id].tgl,
                      'totalUntung':
                          Fnc.rpForm(int.parse(dtList[id].totalUntung)),
                      'totalHmodal':
                          Fnc.rpForm(int.parse(dtList[id].totalHmodal)),
                      'totalHjual':
                          Fnc.rpForm(int.parse(dtList[id].totalHjual)),
                      'totalTerjual': dtList[id].totalTerjual
                    };
                    return Material(
                      child: InkWell(
                        splashColor: AppColors.ungu3,
                        onTap: null,
                        onLongPress: () => _infoSheet(ctx, data),
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
                                        this.tglFormat.format(DateTime.parse(
                                                dtList[id].tgl)) +
                                            cekHari(dtList[id].tgl),
                                        style: Styles.parTxtStyle))
                              ],
                            ),
                            trailing: Styles.btnRaisedStyle(
                                warna: AppColors.ungu2,
                                func: () async {
                                  await Navigator.push(
                                      ctx,
                                      MaterialPageRoute(
                                          builder: (_) => PenjualanDetail(
                                              detailPnjl: data)));
                                },
                                txt: 'Detail',
                                rnd: 20.0)),
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
                    _updateUI();
                  },
                );
              }
              return LoadShimmer(type: 'list', jml: 8);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async => _updateUI(),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            ContWidgets(
              ttlCont: 'LIST PENJUALAN PAKETAN',
              boxCont: this.listPaketan(context),
            )
          ],
        ),
      ),
    );
  }
}
