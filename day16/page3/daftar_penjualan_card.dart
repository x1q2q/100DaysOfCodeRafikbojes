import 'package:flutter/material.dart';
import 'penjualan.dart';

class DaftarPenjualanCard extends StatelessWidget {
  final Penjualan penjualan;
  DaftarPenjualanCard({this.penjualan});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[400],
      margin: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[           
            Text('${penjualan.nmPembeli} ',
              style:TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
            SizedBox(height: 10.0,),
            Divider(height: 10.0,color: Colors.white),
            Text('Alamat ${penjualan.almPembeli}, Tahun ${penjualan.tglJual}'+
            ', dengan total penjualan Rp.${penjualan.totalPenjualan}',
              style:TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              )
            ),
            RaisedButton(
              child: Text('Detail Penjualan',style:TextStyle(color:Colors.white)),
              onPressed: (){
                Navigator.pushReplacementNamed(context,'/barang-detail',arguments:
                {
                  'idLap':'${penjualan.idLap}'
                });
              },
              color: Colors.purple[600],
            ),
          ],
        )
      )
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020