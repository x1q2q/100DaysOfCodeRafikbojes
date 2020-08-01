import '../models/barang_sorotan.dart';
import 'package:flutter/material.dart';

const List<BarangSorotan> barangSorotans = [
  BarangSorotan(
      nama: 'IM3 3GB/30H',
      detail: 'Voucher IM3 untuk 30 hari',
      harga: 30000,
      stok: 12,
      icon: Icon(Icons.credit_card, color: Colors.white),
      image: 'assets/images/voucherim3.png'),
  BarangSorotan(
      nama: 'SmFren2GB+YT',
      detail: 'Voucher IM3 untuk 15 hari',
      harga: 20000,
      stok: 10,
      icon: Icon(Icons.credit_card, color: Colors.white),
      image: 'assets/images/voucherim3.png'),
  BarangSorotan(
      nama: 'TemperedGlass',
      detail: 'TG berkualitas',
      harga: 10000,
      stok: 6,
      icon: Icon(Icons.note_add, color: Colors.white),
      image: 'assets/images/tg.jpg'),
  BarangSorotan(
      nama: 'EarPhone',
      detail: 'Voucher IM3 untuk 30 hari',
      harga: 50000,
      stok: 10,
      icon: Icon(Icons.credit_card, color: Colors.white),
      image: 'assets/images/tg.jpg'),
  BarangSorotan(
      nama: 'Baterry Redmi2',
      detail: 'Kualitas tahan lama baterai redmi',
      harga: 55000,
      stok: 8,
      icon: Icon(Icons.credit_card, color: Colors.white),
      image: 'assets/images/baterai.jpg'),
];
