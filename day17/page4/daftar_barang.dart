import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../page4/barang.dart';
import '../services/getbc_barang.dart';

class DaftarBarang extends StatefulWidget {
  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  final GetbcBarang getbarang = GetbcBarang();
  Future<List<Barang>> futureBarang;

  @override
  void initState(){
    super.initState();
    futureBarang = getbarang.getBarang();
  }
  @override
  Widget build(BuildContext context) {
    const spinkLoad =SpinKitThreeBounce(
      color: Colors.lightGreen,
      size: 50.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("List Barang"),
        elevation: 0.4,
        centerTitle: true,
        backgroundColor: Colors.lightGreen[400],
      ),
      body:Center(
          child: FutureBuilder<List<Barang>>(
            future: futureBarang,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List dtBarang = snapshot.data;
                return ListView.builder(
                  itemCount: dtBarang.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[50],
                      margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
                      child: ListTile(
                        onTap: (){},
                        contentPadding: EdgeInsets.all(5.0),
                        leading: Icon(Icons.photo_size_select_actual),
                        title: Text(dtBarang[index].nmBarang.toUpperCase(),
                        style:TextStyle(
                          fontSize: 16.0,
                          color:Colors.black45,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child:Text("${snapshot.error}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    )
                  ),
                );
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )
      ),
    );
  }
}
// rafikbojes, 2:00 PM 18/06/2020