import '../models/jenis_barang.dart';
import 'package:flutter/material.dart';

const List<JenisBarang> jenisBarangs = [
  JenisBarang(
      jenis: "Accesssories",
      img: 'assets/images/voucher.png',
      detail: 'Aksesoris lengkap mulai dari TG, Battery, Softcase dlsb.',
      warna: Colors.redAccent),
  JenisBarang(
      jenis: "Voucher",
      img: 'assets/images/voucher.png',
      detail: 'Voucher Paket data dengan beragam provider.',
      warna: Colors.orange),
  JenisBarang(
      jenis: "Smartphone",
      img: 'assets/images/phone.png',
      detail: 'Menyediakan penjualan Smartphone merk terbaru.',
      warna: Colors.teal),
  JenisBarang(
      jenis: "Kartu",
      img: 'assets/images/voucher.png',
      detail: 'Tersedia beragam kartu dari beragam provider.',
      warna: Colors.deepPurple),
];
