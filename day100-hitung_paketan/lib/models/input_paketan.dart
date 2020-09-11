class InputPaketan {
  String idKat;
  String idHitung;
  String idPktn;
  String namaPaketan;
  String stokAwal;
  String stokTambah;
  String stokAkhir;
  String tgl;
  InputPaketan(
      {this.idKat,
      this.idHitung,
      this.idPktn,
      this.namaPaketan,
      this.stokAwal,
      this.stokTambah,
      this.stokAkhir,
      this.tgl});
  factory InputPaketan.toMap(Map<String, dynamic> map) {
    return InputPaketan(
        idKat: map['id_kat'],
        idHitung: map['id_hitung'],
        idPktn: map['id_pktn'],
        namaPaketan: map['nama_pktn'],
        stokAwal: map['stok_awal'],
        stokTambah: map['stok_tambah'],
        stokAkhir: map['stok_akhir'],
        tgl: map['tgl']);
  }
  Map toJson() {
    return {
      'id_kat': idKat,
      'id_hitung': idHitung,
      'id_pktn': idPktn,
      'nama_pktn': namaPaketan,
      'stok_awal': stokAwal,
      'stok_tambah': stokTambah,
      'stok_akhir': stokAkhir,
      'tgl': tgl
    };
  }
}
