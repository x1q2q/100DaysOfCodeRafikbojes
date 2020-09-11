import 'package:flutter/material.dart';

class DataProfil {
  String jenis;
  String detail;
  IconData icon;
  Color warna;
  DataProfil({this.jenis, this.detail, this.icon, this.warna});
}

List<DataProfil> dataProfils = [
  DataProfil(
    jenis: 'Nama',
    detail: 'Rafik Bojes',
    icon: Icons.person_outline,
    warna: Colors.amber,
  ),
  DataProfil(
    jenis: 'Kategori',
    detail: 'Staff Konter1',
    icon: Icons.group,
    warna: Colors.teal,
  ),
  DataProfil(
    jenis: 'Alamat',
    detail: 'Pengadegan, Purbalingga',
    icon: Icons.location_on,
    warna: Colors.deepPurple,
  ),
  DataProfil(
    jenis: 'Terakhir Masuk',
    detail: '12:08, 08/12/2020',
    icon: Icons.timer,
    warna: Colors.red,
  ),
];
