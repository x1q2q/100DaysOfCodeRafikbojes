import 'package:flutter/material.dart';

class BarangSorotan {
  final String nama;
  final String detail;
  final int harga;
  final int stok;
  final Icon icon;
  final String image;
  const BarangSorotan(
      {@required this.nama,
      @required this.detail,
      @required this.harga,
      @required this.stok,
      @required this.icon,
      @required this.image});
}
