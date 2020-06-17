import 'package:flutter/material.dart';
import 'package:arkipelago_dev/page3/home.dart';
import 'package:arkipelago_dev/page3/daftar_laporan.dart';
import 'package:arkipelago_dev/page3/daftar_barang.dart';
import 'package:arkipelago_dev/page3/daftar_penjualan.dart';
import 'package:arkipelago_dev/page3/barang_detail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Beginner',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: new Dashboard(title: 'Flutter Demo Home Page'),
      routes: {
        '/':(context) => Home(),
        '/home':(context) => Home(),
        '/daftar-laporan': (context) => DaftarLaporan(),
        '/daftar-barang': (context) => DaftarBarang(),
        '/barang-detail': (context) => BarangDetail(),
        '/daftar-penjualan':(context) => DaftarPenjualan(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}