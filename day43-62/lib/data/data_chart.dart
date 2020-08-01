import 'dart:math';

class DataSales {
  final int tahun;
  final int sales;
  DataSales(this.tahun, this.sales);
  DateTime get date => DateTime(this.tahun, 1, 1);
}

List<DataSales> dataSales1 = [
  for (int i = 2005; i < 2020; i++)
    DataSales(i, (i - 2000) * 40 + Random().nextInt(100)),
];

List<DataSales> dataSales2 = [
  for (int i = 2005; i < 2020; i++)
    DataSales(i, (i - 2000) * 40 + Random().nextInt(100)),
];

class DataHarga {
  final String kategori;
  final int harga;
  const DataHarga(this.kategori, this.harga);
}

List<DataHarga> dataHarga = [
  DataHarga('Voucher', 15000),
  DataHarga('Accessories', 10000),
  DataHarga('Smartphone', 25000),
  DataHarga('Kartu', 10000),
];
