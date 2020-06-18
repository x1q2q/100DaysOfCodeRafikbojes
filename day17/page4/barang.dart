import 'dart:convert';

class Barang{
  String idBarang;
  String nmBarang;
  String hrgBeli;
    
  Barang({this.idBarang,this.nmBarang,
  this.hrgBeli});
  
  factory Barang.fromMap(Map<String, dynamic> json){
    return Barang(idBarang: json['id_brg'],
    nmBarang:json['nm_brg'],hrgBeli: json['hrg_beli']);
  }
}
// rafikbojes, 2:00 PM 18/06/2020