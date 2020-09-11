import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import '../models/stats_paketan.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../widgets/Widgets.dart';
import '../services/hitung_paketan.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PenjualanDetail extends StatefulWidget {
  final Map<String, dynamic> detailPnjl;
  PenjualanDetail({this.detailPnjl});

  @override
  _PenjualanDetailState createState() => _PenjualanDetailState();
}

class _PenjualanDetailState extends State<PenjualanDetail> {
  final HitungPaketan htPaketan = HitungPaketan();
  Future<List<StatsPaketan>> futureListPnjl;
  List<StatsPaketan> dtListPnjl;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  String _progress = "0";
  final String _fileUrl = Fnc.urlAPI + 'cetaklap/';
  final Dio _dio = Dio();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool notOpened = false;

  @override
  void initState() {
    super.initState();
    this.futureListPnjl =
        htPaketan.getPenjualanDetail(widget.detailPnjl['tgl']);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android, iOS);

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: _onSelectNotification);
  }

  String stokTerjual(dtList) {
    int res = int.parse(dtList.stokAwal) +
        int.parse(dtList.stokTambah) -
        int.parse(dtList.stokAkhir);
    return res.toString();
  }

  void _updateUI() async {
    setState(() {
      this.futureListPnjl =
          htPaketan.getPenjualanDetail(widget.detailPnjl['tgl']);
    });
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> _requestPermissions() async {
    var permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }

  _loadAlert(BuildContext ctx) async {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BaseAlert(
              ttl: 'Mendownload...',
              content: LinearProgressIndicator(),
              yesBtn: null,
              noBtn: () => Navigator.of(ctx).pop(),
              yesTxt: "",
              noTxt: "Tutup");
        });
  }

  Future<void> _download(BuildContext ctx) async {
    String tgl = Fnc.tglYMD(DateTime.parse(widget.detailPnjl['tgl']));
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();

    if (isPermissionStatusGranted) {
      final savePath = path.join(dir.path, "lap-vcher_" + tgl + ".pdf");
      await _startDownload(ctx, savePath, _fileUrl + tgl);
    } else {
      AwesomeDialog(
        context: context,
        width: 450,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'ERROR\n',
        desc: 'Tidak Bisa Menyimpan File!',
        btnOkColor: Colors.red,
        btnOkOnPress: () {},
      )..show();
    }
  }

  Future<void> _startDownload(
      BuildContext ctx, String savePath, String urlAPI) async {
    _loadAlert(ctx);
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await _dio.download(urlAPI, savePath,
          onReceiveProgress: _onReceiveProgress);
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      setState(() => this.notOpened = true);
      Navigator.pop(ctx);
      await _showNotification(result);
    }
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      setState(() {
        this._progress = (received / total * 100).toStringAsFixed(0) + "%";
      });
    }
    print(this._progress);
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description',
        priority: Priority.High, importance: Importance.Max);
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android, iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
        0, // notification id
        isSuccess ? 'Success' : 'Failure',
        isSuccess
            ? 'File Berhasil didownload!'
            : 'Error Saat Mendownload File.',
        platform,
        payload: json);
  }

  Future<void> _onSelectNotification(String json) async {
    final obj = jsonDecode(json);
    if (this.notOpened) {
      if (obj['isSuccess']) {
        OpenFile.open(obj['filePath']);
      } else {
        AwesomeDialog(
          context: context,
          width: 450,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'ERROR\n',
          desc: '${obj['error']}',
          btnOkColor: Colors.red,
          btnOkOnPress: () {},
        )..show();
      }
    }
  }

  void _openSheetDetail(StatsPaketan data, BuildContext ctx) {
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
                  title: Text('Detail Hitung Paketan',
                      style: Styles.midTitleTxtStyle),
                  trailing: Icon(Icons.card_giftcard, color: AppColors.ungu3),
                ),
                Divider(thickness: 1, color: AppColors.ungu3),
                ListTile(
                  title: Text('Nama Paketan'),
                  trailing:
                      Text(data.namaPaketan.toUpperCase(), style: boldStyle),
                ),
                ListTile(
                  title: Text('Harga Jual Paketan'),
                  trailing: Text(Fnc.rpForm(int.parse(data.hargaJual)),
                      style: boldStyle),
                ),
                ListTile(
                  title: Text('Untung/paketan'),
                  trailing:
                      Text(Fnc.rpForm(int.parse(data.laba)), style: boldStyle),
                ),
                Divider(thickness: 0.4, color: Colors.black54),
                ListTile(
                  title: Text('Total Untung Paketan/tgl'),
                  trailing: Text(Fnc.rpForm(int.parse(data.untung)),
                      style: boldStyle),
                ),
                ListTile(
                  title: Text('Stok Awal / Tambah / Akhir'),
                  trailing: Text(
                      '${data.stokAwal} / ${data.stokTambah} / ${data.stokAkhir} PCS',
                      style: boldStyle),
                ),
                ListTile(
                  title: Text('Terjual'),
                  trailing: Text(stokTerjual(data) + ' PCS', style: boldStyle),
                ),
              ],
            ),
          );
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

  Widget detailPnjl(BuildContext ctx) {
    return Column(
      children: <Widget>[
        colInput(
            'Tanggal Penjualan',
            Styles.btnRaisedStyle(
                warna: AppColors.red3,
                icon: Icons.date_range,
                txt: widget.detailPnjl['tgl'],
                rnd: 20.0)),
        colInput(
            'Total Harga Modal',
            Styles.btnRaisedStyle(
                warna: AppColors.red3,
                icon: Icons.store,
                txt: widget.detailPnjl['totalHmodal'],
                rnd: 20.0)),
        colInput(
            'Total Harga Jual',
            Styles.btnRaisedStyle(
                warna: AppColors.red3,
                icon: Icons.wallet_giftcard,
                txt: widget.detailPnjl['totalHjual'],
                rnd: 20.0)),
        colInput(
            'Total Untung',
            Styles.btnRaisedStyle(
                warna: AppColors.red3,
                icon: Icons.monetization_on,
                txt: widget.detailPnjl['totalUntung'],
                rnd: 20.0)),
        colInput(
            'Total Terjual',
            Styles.btnRaisedStyle(
                warna: AppColors.red3,
                icon: Icons.credit_card,
                txt: widget.detailPnjl['totalTerjual'] + ' PCS',
                rnd: 20.0)),
      ],
    );
  }

  Widget detailHitungPaketan(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        child: FutureBuilder<List<StatsPaketan>>(
            future: this.futureListPnjl,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtList = snapshot.data;
                dtListPnjl = dtList;
                if (dtList.isEmpty)
                  return ContImgtxt(
                    img: true,
                    type: 'warning-datalist',
                    txt:
                        'Data Penjualan Detail Tanggal ${widget.detailPnjl['tgl']} Kosong!',
                  );
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black45,
                    thickness: 0.4,
                  ),
                  itemCount: dtListPnjl.length,
                  itemBuilder: (_, int id) {
                    return Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              _openSheetDetail(dtListPnjl[id], context);
                            },
                            child: ListTile(
                                leading: Chip(
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.purple[100],
                                    child: Text('${id + 1}'),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  label: Text(
                                      dtListPnjl[id].namaPaketan.toUpperCase(),
                                      style: Styles.parTxtStyle),
                                ),
                                trailing: Chip(
                                  avatar: null,
                                  label: Text(
                                      stokTerjual(dtListPnjl[id]) + ' terjual'),
                                ))));
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              } else if (snapshot.hasError) {
                return ContImgtxt(
                  img: true,
                  type: 'error-datalist',
                  txt: 'Tidak Dapat Mengambil Data \n Silakan Refresh Ulang!',
                  loadData: () async {
                    _updateUI();
                  },
                );
              }
              return LoadShimmer(type: 'list', jml: 5);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'penjualan-detail',
          title: 'Penjualan Detail',
          actBtn: [
            MenuNav(
                func: () async => _download(context),
                icon: Icon(
                  Icons.file_download,
                  color: AppColors.red1,
                ))
          ],
        ),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async => _updateUI(),
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(children: <Widget>[
                  ContWidgets(
                      ttlCont: "DETAIL PENJUALAN #${widget.detailPnjl['id']}",
                      boxCont: this.detailPnjl(context)),
                  ContWidgets(
                      ttlCont: 'LIST HITUNG-PAKETAN',
                      boxCont: this.detailHitungPaketan(context))
                ]))));
  }
}
