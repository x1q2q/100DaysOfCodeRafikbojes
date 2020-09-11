import 'package:flutter/material.dart';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:intl/intl.dart';
import '../models/input_kategori.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../services/hitung_paketan.dart';
import '../screens/home.dart';
import 'hitung_confirm.dart';
// import '../services/database_helper.dart';

class Hitung extends StatefulWidget {
  @override
  _HitungState createState() => _HitungState();
}

class _HitungState extends State<Hitung> {
  var tglFormat = DateFormat('yyyy-MM-dd');
  DateTime tglSkrg = DateTime.now();
  DateTime tgl = DateTime.now();

  final HitungPaketan htPaketan = HitungPaketan();
  Future<List<InputKategori>> futuretListpaketan;
  List<InputKategori> dtListPaketan = List();
  final _formListInput = GlobalKey<FormState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool savedLocal = true;
  String onData = 'not-temp';
  bool haveTempData = false;

  @override
  void initState() {
    super.initState();
    // DatabaseHelper.instance.getHitung("${tglFormat.format(tgl)}").then((val) {
    //   this.haveTempData = val;
    // });
    this.futuretListpaketan =
        htPaketan.getPaketanList("${tglFormat.format(tgl)}");
  }

  Future<void> _updateUI(String type) async {
    this.futuretListpaketan =
        // type == 'temp' ? DatabaseHelper.instance.getDataTemp("${tglFormat.format(tgl)}"):
        htPaketan.getPaketanList("${tglFormat.format(tgl)}");
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: tgl,
            firstDate: DateTime(2020, 8),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        tgl = value ?? tgl;
        this.futuretListpaketan =
            htPaketan.getPaketanList("${tglFormat.format(tgl)}");
      });
    });
    // DatabaseHelper.instance.getHitung("${tglFormat.format(tgl)}").then((val) {
    //   this.haveTempData = val;
    //   this.onData = 'not-temp';
    // });
    setState(() {});
  }

  // Future<void> _addPktnItem(List<InputKategori> data) async {
  //   data.forEach((el) async {
  //     el.paketan.forEach((pk) async {
  //       // INSERT INTO PAKETAN
  //       if (await DatabaseHelper.instance.notInTable(
  //           "hitung", "id_pktn='${pk.idPktn}' and tgl='${pk.tgl}'")) {
  //         await DatabaseHelper.instance.insertPktn(pk);
  //       } else {
  //         await DatabaseHelper.instance.updatePktn(pk);
  //       }
  //     });
  //     // INSERT INTO KATEGORI
  //     if (await DatabaseHelper.instance
  //         .notInTable("kategori", "id_kat='${el.idKat}'")) {
  //       await DatabaseHelper.instance.insertKat(el);
  //     } else {
  //       await DatabaseHelper.instance.updateKat(el);
  //     }
  //   });
  // }

  void _editData(
      List<InputKategori> dtList, String id, String val, String stok) {
    dtList.forEach((valList) {
      valList.paketan.forEach((e) {
        if (id == e.idHitung)
          stok == 'st-tambah' ? e.stokTambah = val : e.stokAkhir = val;
      });
    });
  }

  void _saveDataTemp(List<InputKategori> data, BuildContext ctx) async {
    this.savedLocal = true;
    // await _addPktnItem(this.dtListPaketan);
    await _succAlert(ctx);
  }

  void _submitData(BuildContext ctx, List<InputKategori> dtList) {
    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (_) => HitungConfirm(
                dtKategori: dtList, tgl: "${tglFormat.format(tgl)}")));
  }

  Future<bool> _backPressed(BuildContext context) {
    var confAlert = BaseAlert(
        ttl: "Kembali Halaman",
        content: Text("Data input belum disave, lanjutkan kembali?"),
        yesBtn: () async {
          // await _addPktnItem(this.dtListPaketan);
          Navigator.of(context).pop(true);
        },
        noBtn: () => Navigator.of(context).pop(true),
        yesTxt: "Save",
        noTxt: "Kembali");
    if (this.savedLocal) {
      return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    }
    return showDialog(
        context: context, builder: (BuildContext context) => confAlert);
  }

  _confDataTemp(BuildContext context) async {
    var confAlert = BaseAlert(
        ttl: "Load Data Temporary",
        content: Text(
            "Terdapat data temporary untuk hitung tanggal ${tglFormat.format(tgl)}, load data?"),
        yesBtn: () async {
          await this._updateUI('temp');
          setState(() => this.onData = 'temp');
          Navigator.of(context).pop(true);
        },
        noBtn: () async {
          this.haveTempData = false;
          Navigator.of(context).pop(true);
        },
        yesTxt: "Ya",
        noTxt: "Tidak");
    return showDialog(
        context: context, builder: (BuildContext context) => confAlert);
  }

  _succAlert(BuildContext ctx) async {
    AwesomeDialog(
      context: ctx,
      width: 450,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      title: 'SUKSES\n',
      desc: 'DATA TEMPORARY TANGGAL ${tglFormat.format(tgl)} BERHASIL DISAVE!',
      btnOkOnPress: () {},
    )..show();
  }

  _warnAlert(BuildContext ctx) async {
    AwesomeDialog(
      context: ctx,
      width: 450,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      title: 'PERINGATAN\n',
      desc: 'DATA KOSONG.\nSILAKAN REFRESH KEMBALI!',
      btnOkColor: Colors.amber,
      btnOkOnPress: () {},
    )..show();
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

  Widget datePicker(BuildContext ctx) {
    return InkWell(
      onTap: () {
        _selectDate(ctx);
      },
      child: SizedBox(
        width: 85,
        child: new TextField(
            enabled: false,
            decoration: InputDecoration(hintText: "${tglFormat.format(tgl)}")),
      ),
    );
  }

  Widget listInput(List<InputKategori> dtList, dtInput, BuildContext ctx) {
    double listInWidth = MediaQuery.of(ctx).size.width * .12;
    return Row(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: SizedBox(
                width: listInWidth,
                child: new TextFormField(
                  key: Key(dtInput.stokAwal.toString()),
                  textAlign: TextAlign.center,
                  enabled: false,
                  initialValue: dtInput.stokAwal.toString(),
                  decoration: InputDecoration(labelText: 'st-awal'),
                ))),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Colors.black26,
            child: SizedBox(
                width: listInWidth + 18,
                child: new TextFormField(
                  key: Key(dtInput.stokTambah.toString()),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  onSaved: (val) {
                    _editData(dtList, dtInput.idHitung, val, 'st-tambah');
                  },
                  enabled: true,
                  initialValue: dtInput.stokTambah.toString(),
                  decoration: InputDecoration(labelText: 'st-tambah'),
                ))),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: SizedBox(
                width: listInWidth,
                child: new TextFormField(
                    key: Key(dtInput.stokAkhir.toString()),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    onSaved: (val) {
                      _editData(dtList, dtInput.idHitung, val, 'st-akhir');
                    },
                    enabled: true,
                    initialValue: dtInput.stokAkhir.toString(),
                    decoration: InputDecoration(labelText: 'st-akhir')))),
      ],
    );
  }

  Widget dataPaketan(BuildContext context) {
    return Form(
        key: _formListInput,
        autovalidate: true,
        onChanged: () {
          Form.of(primaryFocus.context).save();
          this.savedLocal = false;
        },
        child: FutureBuilder<List<InputKategori>>(
            future: futuretListpaketan,
            builder: (BuildContext ctx, snapshot) {
              if (snapshot.hasData) {
                if (this.haveTempData && this.onData == 'not-temp')
                  Future.delayed(
                      Duration.zero, () async => await _confDataTemp(context));
                List<InputKategori> dtList = snapshot.data;
                dtListPaketan = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt:
                        'Data Hitung Paketan Tanggal ${tglFormat.format(tgl)} Kosong!',
                  );

                return ListView.builder(
                  itemCount: dtList.length,
                  itemBuilder: (_, int id) {
                    return Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {},
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      color: AppColors.red0,
                                      child: Row(children: <Widget>[
                                        ClipOval(
                                            child: Container(
                                          width: 35,
                                          height: 35,
                                          color: Colors.white54,
                                          child: Center(
                                              child: Text("${id + 1}",
                                                  style:
                                                      Styles.bTitleTxtStyle)),
                                        )),
                                        Text(
                                          ' ' +
                                              dtList[id].kategori.toUpperCase(),
                                          style: Styles.bTitleTxtStyle,
                                        )
                                      ])),
                                  ...dtListPaketan[id]
                                      .paketan
                                      .map((wdgt) => colInput(
                                          wdgt.namaPaketan.toUpperCase(),
                                          listInput(
                                              dtListPaketan, wdgt, context)))
                                      .toList()
                                ])));
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              } else if (snapshot.hasError) {
                if (this.haveTempData && this.onData == 'not-temp')
                  Future.delayed(
                      Duration.zero, () async => await _confDataTemp(context));
                return ContImgtxt(
                  img: true,
                  type: 'error-datalist',
                  txt: 'Tidak Dapat Mengambil Data. \n Silakan Refresh Ulang!',
                  loadData: () async {
                    _updateUI(this.onData);
                  },
                );
              }

              return LoadShimmer(type: 'list', jml: 8);
            }));
  }

  Widget formHitung(BuildContext ctx) {
    return Column(
      children: <Widget>[
        colInput('Tanggal Hitung', datePicker(ctx)),
        this.dataPaketan(ctx)
      ],
    );
  }

  Widget contBtmNav(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.red0, boxShadow: [Styles.boxColShdStyle]),
      width: double.infinity,
      height: kToolbarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.grey,
                  elevation: 0,
                  highlightElevation: 2,
                  onPressed: () async => this.dtListPaketan.isNotEmpty
                      ? _saveDataTemp(this.dtListPaketan, ctx)
                      : await _warnAlert(ctx),
                  child: Text(
                    'SAVE LOCAL',
                    style: Styles.btnTxtStyle,
                  ))),
          Expanded(
              child: MaterialButton(
            padding: EdgeInsets.all(0),
            color: AppColors.red3,
            elevation: 0,
            highlightElevation: 2,
            onPressed: () async => this.dtListPaketan.isNotEmpty
                ? _submitData(ctx, dtListPaketan)
                : _warnAlert(ctx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CONFIRM ',
                  style: Styles.btnTxtStyle,
                ),
                Icon(
                  Icons.send,
                  color: Colors.white,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => _backPressed(context),
        child: new Scaffold(
          backgroundColor: AppColors.grey1,
          appBar: new DefAppBar(
            tipe: 'hitung',
            title: 'Hitung',
            actBtn: null,
          ),
          body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                _updateUI(this.onData);
              },
              child: new SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ContWidgets(
                      ttlCont: 'FORM HITUNG PAKETAN',
                      boxCont: this.formHitung(context),
                    )
                  ],
                ),
              )),
          bottomNavigationBar: this.contBtmNav(context),
        ));
  }
}
