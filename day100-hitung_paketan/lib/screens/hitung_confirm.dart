import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../models/input_kategori.dart';
import '../models/input_paketan.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../widgets/Widgets.dart';
import '../services/hitung_paketan.dart';
import 'home.dart';
// import '../services/database_helper.dart';

class HitungConfirm extends StatefulWidget {
  final List<InputKategori> dtKategori;
  final String tgl;
  HitungConfirm({this.dtKategori, this.tgl});
  @override
  _HitungConfirmState createState() => _HitungConfirmState();
}

class _HitungConfirmState extends State<HitungConfirm> {
  List<String> dtError = List();
  @override
  void initState() {
    super.initState();
    this._cekData(widget.dtKategori);
  }

  _loadAlert(BuildContext ctx) async {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BaseAlert(
              ttl: 'Loading..',
              content: LinearProgressIndicator(),
              yesBtn: null,
              noBtn: () => Navigator.of(ctx).pop(),
              yesTxt: "",
              noTxt: "cancel");
        });
  }

  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }

  void _submitData(List<InputKategori> data, BuildContext ctx) async {
    await _loadAlert(ctx);
    bool resSubmit;
    resSubmit =
        await HitungPaketan().updateListPaketan(dtRes(data), widget.tgl);
    Navigator.pop(ctx);
    if (resSubmit == true) {
      // await DatabaseHelper.instance.deletePktn(widget.tgl);
      AwesomeDialog(
        context: ctx,
        width: 450,
        dialogType: DialogType.SUCCES,
        animType: AnimType.SCALE,
        title: 'SUKSES\n',
        desc: 'BERHASIL SUBMIT DATA HITUNG PAKETAN TANGGAL ' + widget.tgl,
        btnOkText: 'OK',
        btnOkIcon: Icons.check_circle,
        btnOkOnPress: () {},
      )..show()
          .then((value) => makeRoutePage(context: context, pageRef: Home()));
    } else {
      AwesomeDialog(
          context: ctx,
          width: 450,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'ERROR\n',
          desc: 'GAGAL SUBMIT DATA!',
          btnOkText: 'ULANGI',
          btnCancelText: 'TUTUP',
          btnCancelIcon: Icons.arrow_back_ios,
          btnOkIcon: Icons.refresh,
          btnCancelOnPress: () =>
              makeRoutePage(context: context, pageRef: Home()),
          btnOkOnPress: () async => this._submitData(data, ctx))
        ..show();
    }
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

  Widget listText(dtInput, BuildContext context) {
    double contWidth = MediaQuery.of(context).size.width * .12;
    return Row(
      children: <Widget>[
        Container(
            width: contWidth,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Text(dtInput.stokAwal, textAlign: TextAlign.center)),
        Container(
            width: contWidth,
            padding: EdgeInsets.all(4),
            color: Colors.black26,
            child: Text(dtInput.stokTambah, textAlign: TextAlign.center)),
        Container(
            width: contWidth,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(dtInput.stokAkhir, textAlign: TextAlign.center)),
      ],
    );
  }

  Widget contInput(BuildContext ctx) {
    return ListView.builder(
      itemCount: widget.dtKategori.length,
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
                          child: Text(
                            widget.dtKategori[id].kategori.toUpperCase(),
                            style: Styles.bTitleTxtStyle,
                          )),
                      ...widget.dtKategori[id].paketan
                          .map((wdgt) => colInput(
                              wdgt.namaPaketan.toUpperCase(),
                              listText(wdgt, ctx)))
                          .toList()
                    ])));
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  List<InputPaketan> dtRes(List data) {
    List<InputPaketan> newList = List();
    data.map((e) => e.paketan).toList().forEach((val) => newList.addAll(val));
    return newList;
  }

  void _cekData(List data) {
    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.parse(s, (e) => null) != null;
    }

    List<InputPaketan> input = this.dtRes(data);
    input.forEach((el) async {
      if (!isNumeric(el.stokAwal) ||
          !isNumeric(el.stokTambah) ||
          !isNumeric(el.stokAkhir)) {
        setState(() {
          this.dtError.add(el.namaPaketan);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'hitung-confirm',
          title: 'Konfirmasi Hitung',
          actBtn: [
            MenuNav(
                func: widget.dtKategori.isNotEmpty
                    ? () async {
                        if (dtError.isEmpty) {
                          var confAlert = BaseAlert(
                              ttl: "Konfirmasi Submit",
                              content:
                                  Text("Lanjutkan untuk submit data input?"),
                              yesBtn: () async {
                                Navigator.of(context).pop();
                                _submitData(widget.dtKategori, context);
                              },
                              noBtn: () => Navigator.of(context).pop(),
                              yesTxt: "Submit",
                              noTxt: "Cancel");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => confAlert);
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BaseAlert(
                                    ttl: 'Error..',
                                    content: Text(
                                        'Input paketan (' +
                                            dtError.join(', ') +
                                            ') bukan berupa angka!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    yesBtn: null,
                                    noBtn: () => Navigator.of(context).pop(),
                                    yesTxt: "",
                                    noTxt: "Ok");
                              });
                        }
                      }
                    : null,
                icon: Icon(
                  Icons.check,
                  color: AppColors.red1,
                ))
          ],
        ),
        body: widget.dtKategori.isNotEmpty
            ? SingleChildScrollView(
                child: Column(children: <Widget>[
                ContWidgets(
                    ttlCont: 'KONFIRMASI INPUT PAKETAN (${widget.tgl})',
                    boxCont: this.contInput(context))
              ]))
            : ContImgtxt(
                txt: 'Error! \n Data Kosong',
                img: false,
                type: 'error-datalist',
              ));
  }
}
