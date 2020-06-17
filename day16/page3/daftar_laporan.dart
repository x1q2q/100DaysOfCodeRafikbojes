import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:arkipelago_dev/page3/laporan.dart';
import 'package:arkipelago_dev/page3/daftar_laporan_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DaftarLaporan extends StatefulWidget {
  @override
  _DaftarLaporanState createState() => _DaftarLaporanState();
}

class _DaftarLaporanState extends State<DaftarLaporan> {
  List<Laporan> dataJson = [
    // Laporan(),
  ];
  List dataNew = [];
  void getData() async{
    Response resp = await get('http://localhost/getbc_app/Api/laporan');
    // List data = jsonDecode(resp.body);
    var detail = await jsonDecode(resp.body)['data'];
    dataNew.add(detail);
    setState(() {
      for(int i=0;i<dataNew[0].length;i++){
      dataJson.add(Laporan(
          idLap: num.parse(dataNew[0][i]['id_lap']),
          userId: num.parse(dataNew[0][i]['user_id']),
          tglBuat: dataNew[0][i]['tgl_buat'],
          tglDownload: dataNew[0][i]['tgl_download'],
          semester: dataNew[0][i]['semester'],
          thPljrn: dataNew[0][i]['th_pljrn']
        ));
      }
    });
  }

  @override
  void initState(){ // function yang dijalankan pertama kali ketika meload class ini
    super.initState();
    getData();
  }
  Widget listCard(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dataJson.map((dt) => DaftarLaporanCard(
        laporan: dt,
      )).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    const loader = SpinKitRing(
      color: Colors.black38,
      size: 50.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("List Laporan"),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
      ),
      body: SafeArea(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: this.dataJson.length == 0? loader: listCard(),
        ),
      ),
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020