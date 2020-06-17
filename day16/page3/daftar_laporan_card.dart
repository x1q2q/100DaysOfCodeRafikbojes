import 'package:flutter/material.dart';
import 'laporan.dart';

class DaftarLaporanCard extends StatelessWidget {
  final Laporan laporan;
  // final Function openDetail;
  DaftarLaporanCard({this.laporan});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      margin: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[           
            Text('${laporan.thPljrn}',
              style:TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              )
            ),
            SizedBox(height: 10.0,),
            Divider(height: 10.0,color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${laporan.tglBuat} - ${laporan.semester}',
                  style:TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  )
                ),
                RaisedButton(
                  child: Text('Detail Laporan',style:TextStyle(color:Colors.white)),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context,'/daftar-penjualan',arguments:
                    {
                      'id':'${laporan.idLap}'
                    });
                  },
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}
// rafikbojes, 08:00 AM, 17/06/2020