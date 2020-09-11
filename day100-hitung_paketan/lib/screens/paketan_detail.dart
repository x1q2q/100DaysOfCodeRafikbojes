import 'package:flutter/material.dart';
import 'dart:async';
import '../models/pktn_dtlpaketan.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../services/hitung_paketan.dart';

class PaketanDetail extends StatefulWidget {
  final Map<String, dynamic> detailPktn;

  PaketanDetail({this.detailPktn});

  @override
  _PaketanDetailState createState() => _PaketanDetailState();
}

class _PaketanDetailState extends State<PaketanDetail> {
  final HitungPaketan htPaketan = HitungPaketan();
  Future<PktnDtlpaketan> futureDtlpktn;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    this.futureDtlpktn = htPaketan.getPaketanDetail(
        widget.detailPktn['idPktn'], widget.detailPktn['tgl']);
  }

  void _updateUI() async {
    setState(() {
      this.futureDtlpktn = htPaketan.getPaketanDetail(
          widget.detailPktn['idPktn'], widget.detailPktn['tgl']);
    });
  }

  String stokTerjual(dtList) {
    int res = int.parse(dtList.stokAwal) +
        int.parse(dtList.stokTambah) -
        int.parse(dtList.stokAkhir);
    return res.toString();
  }

  Widget descCont(String key, String val) {
    const wDescTxt = TextStyle(
        color: Colors.white,
        fontSize: 15.3,
        fontWeight: FontWeight.w500,
        fontFamily: 'Nunito');
    return Container(
        decoration: BoxDecoration(
            color: AppColors.red01,
            boxShadow: [Styles.boxCardShdStyle],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(key, style: wDescTxt),
            Chip(
                avatar: null,
                backgroundColor: Colors.red[100],
                label: Text(val.toUpperCase())),
          ],
        ));
  }

  Widget strikeLine() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Divider(thickness: 5, color: AppColors.red01),
    );
  }

  Widget detailPaketan(BuildContext ctx, PktnDtlpaketan data) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red[100], boxShadow: [Styles.boxCardShdStyle]),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(children: <Widget>[
              Text(data.kategori.toUpperCase(),
                  style: Styles.lgTxtStyle(Colors.black38)),
              Chip(
                  avatar: null,
                  backgroundColor: AppColors.red1,
                  label: Text(data.namaPaketan.toUpperCase(),
                      style: Styles.lgTxtStyle(Colors.white))),
            ]),
          ),
          Container(
              color: Colors.white70,
              padding: EdgeInsets.all(15),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: <Widget>[
                  this.descCont('Stok', data.stokAwal + '-PCS'),
                  this.descCont('Laba', Fnc.rpForm(int.parse(data.laba))),
                  this.descCont(
                      'Modal', Fnc.rpForm(int.parse(data.hargaModal))),
                  this.descCont('Jual', Fnc.rpForm(int.parse(data.hargaJual))),
                ],
              )),
        ]);
  }

  Widget timelinePnjl(data) {
    return ContWidgets(
        ttlCont: 'TIMELINE PENJUALAN',
        boxCont: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black45,
            thickness: 0.4,
          ),
          itemCount: data.hitungUntung.length,
          itemBuilder: (_, int id) {
            return Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: ListTile(
                        leading: Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.red[100],
                            child: Text('${id + 1}'),
                          ),
                          backgroundColor: Colors.transparent,
                          label: Text(data.hitungUntung[id].tgl.toUpperCase(),
                              style: Styles.parTxtStyle),
                        ),
                        trailing: Chip(
                          avatar: null,
                          label:
                              Text(data.hitungUntung[id].terjual + ' terjual'),
                        ))));
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'paketan-detail',
          title: 'Detail Paketan',
          actBtn: [],
        ),
        body: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: () async => _updateUI(),
            child: FutureBuilder<PktnDtlpaketan>(
                future: this.futureDtlpktn,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return ListView(
                      children: <Widget>[
                        this.detailPaketan(context, data),
                        this.strikeLine(),
                        this.timelinePnjl(data)
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return ContWidgets(
                        ttlCont: '',
                        boxCont: ContImgtxt(
                          img: true,
                          type: 'error-datalist',
                          txt:
                              'Tidak Dapat Mengambil Data. \n Silakan Refresh Ulang!',
                          loadData: _updateUI,
                        ));
                  }
                  return Container(
                      color: Colors.white,
                      child: LoadShimmer(type: 'paketan', jml: 5));
                })));
  }
}
