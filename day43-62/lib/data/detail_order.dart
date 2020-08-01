import 'package:flutter/material.dart';

class DetailOrder {
  final Icon icon;
  final String jenis;
  final String detail;
  final String tgl;
  const DetailOrder({this.icon, this.jenis, this.detail, this.tgl});
}

const List<DetailOrder> detailOrders = [
  DetailOrder(
      icon: Icon(Icons.credit_card),
      jenis: 'Pembelian',
      detail: 'telah terjadi pembelian',
      tgl: '2020/07/04'),
  DetailOrder(
      icon: Icon(Icons.cached),
      jenis: 'Penukaran',
      detail: 'telah terjadi penukaran',
      tgl: '2020/07/04'),
  DetailOrder(
      icon: Icon(Icons.credit_card),
      jenis: 'Pembelian',
      detail: 'telah terjadi pembelian',
      tgl: '2020/07/04'),
  DetailOrder(
      icon: Icon(Icons.card_giftcard),
      jenis: 'Hadiah',
      detail: 'telah terjadi hadiah',
      tgl: '2020/07/04'),
  DetailOrder(
      icon: Icon(Icons.credit_card),
      jenis: 'Pembelian',
      detail: 'telah terjadi pembelian',
      tgl: '2020/07/04'),
  DetailOrder(
      icon: Icon(Icons.cached),
      jenis: 'Penukaran',
      detail: 'telah terjadi penukaran',
      tgl: '2020/07/04'),
];
