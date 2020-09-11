class StatsPaketan {
  String idHitung;
  String namaPaketan;
  String stokAwal;
  String stokTambah;
  String stokAkhir;
  String hargaJual;
  String laba;
  String untung;
  StatsPaketan(
      {this.idHitung,
      this.namaPaketan,
      this.stokAwal,
      this.stokTambah,
      this.stokAkhir,
      this.hargaJual,
      this.laba,
      this.untung});
  factory StatsPaketan.fromMap(Map<String, dynamic> map) {
    return StatsPaketan(
        idHitung: map['id_hitung'],
        namaPaketan: map['nama_pktn'],
        stokAwal: map['stok_awal'],
        stokTambah: map['stok_tambah'],
        stokAkhir: map['stok_akhir'],
        hargaJual: map['harga_jual'],
        laba: map['laba'],
        untung: map['untung']);
  }
  Map toJson() {
    return {
      'id_hitung': idHitung,
      'nama_pktn': namaPaketan,
      'stok_awal': stokAwal,
      'stok_tambah': stokTambah,
      'stok_akhir': stokAkhir,
      'harga_jual': hargaJual,
      'laba': laba,
      'untung': untung
    };
  }
}
