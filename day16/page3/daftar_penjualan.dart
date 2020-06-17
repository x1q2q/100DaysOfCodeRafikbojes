import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'penjualan.dart';
import 'package:arkipelago_dev/page3/daftar_penjualan_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DaftarPenjualan extends StatefulWidget {
  @override
  _DaftarPenjualanState createState() => _DaftarPenjualanState();
}

class _DaftarPenjualanState extends State<DaftarPenjualan> {
  List <Penjualan> dataJson = [];
  List dtNew = [];
  Map idLap = {};

  void getData() async{  
    Response resp = await get('http://localhost/getbc_app/Api/penjualan/lap_id/${idLap["id"]}');
    var detail = await jsonDecode(resp.body)['data'];
    dtNew.add(detail);
    setState(() {
      for(int i=0;i<dtNew[0].length;i++){
      dataJson.add(Penjualan(
          idPnjl: num.parse(dtNew[0][i]['id_pnjl']),
          idLap: num.parse(dtNew[0][i]['lap_id']),
          nmPembeli: dtNew[0][i]['nm_pembeli'],
          almPembeli: dtNew[0][i]['alm_pembeli'],
          tglJual: dtNew[0][i]['tgl_jual'],
          totalPenjualan: dtNew[0][i]['total_pnjl'],
          waktuAmbil: dtNew[0][i]['wkt_ambil']
        ));
      }
    });
  }

  @override
  void initState(){ // function yang dijalankan pertama kali ketika meload class ini
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      getData();  
    }); 
  }
  
  Widget listCard(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:dataJson.map((dt) => DaftarPenjualanCard(
        penjualan: dt,
      )).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    const loader = SpinKitRing(
      color: Colors.black38,
      size: 50.0,
    );
    idLap = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("List Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
      ),
      body: SafeArea(
        child: Container(
          padding: new EdgeInsets.all(10.0),
          child: this.dataJson.length == 0 ? loader :listCard(),  
        ),
      ),
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020