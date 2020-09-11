class DataPaketan {
  String idPktn;
  String namaPaketan;
  String stokAwal;
  String stokTambah;
  String stokAkhir;
  DataPaketan(
      {this.idPktn,
      this.namaPaketan,
      this.stokAwal,
      this.stokTambah,
      this.stokAkhir});
}

List<DataKategori> dataKategoris1 = <DataKategori>[
  DataKategori(kategori: 'Tri', paketan: [
    DataPaketan(
        idPktn: '1',
        namaPaketan: 'tri-aon2',
        stokAwal: '20',
        stokTambah: '0',
        stokAkhir: '0'),
    DataPaketan(
        idPktn: '2',
        namaPaketan: 'tri-aon1',
        stokAwal: '10',
        stokTambah: '0',
        stokAkhir: '0'),
  ]),
  DataKategori(kategori: 'Axis', paketan: [
    DataPaketan(
        idPktn: '3',
        namaPaketan: 'axis-1/5',
        stokAwal: '15',
        stokTambah: '10',
        stokAkhir: '0'),
  ]),
  DataKategori(kategori: 'Indosat', paketan: [
    DataPaketan(
        idPktn: '4',
        namaPaketan: 'isat-1/7',
        stokAwal: '12',
        stokTambah: '8',
        stokAkhir: '0'),
    DataPaketan(
        idPktn: '5',
        namaPaketan: 'isat-1+yt',
        stokAwal: '12',
        stokTambah: '19',
        stokAkhir: '20'),
  ]),
  DataKategori(kategori: 'Telkomsel', paketan: [
    DataPaketan(
        idPktn: '6',
        namaPaketan: 'tsel-2.5',
        stokAwal: '17',
        stokTambah: '0',
        stokAkhir: '0'),
    DataPaketan(
        idPktn: '7',
        namaPaketan: 'tsel-3.5',
        stokAwal: '14',
        stokTambah: '0',
        stokAkhir: '0'),
  ]),
  DataKategori(kategori: 'Smartfren', paketan: [
    DataPaketan(
        idPktn: '7',
        namaPaketan: 'Smartfren 10GBFUll/30',
        stokAwal: '13',
        stokTambah: '0',
        stokAkhir: '0'),
  ]),
];

class DataKategori {
  String kategori;
  List<DataPaketan> paketan;
  DataKategori({this.kategori, this.paketan});
}
