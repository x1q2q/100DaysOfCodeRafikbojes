class PktnKategori {
  String idKat;
  String kategori;
  String detail;
  PktnKategori({this.idKat, this.kategori, this.detail});

  factory PktnKategori.fromMap(Map<String, dynamic> map) {
    return PktnKategori(
        idKat: map['id_kat'], kategori: map['kategori'], detail: map['detail']);
  }
  Map toJson() {
    return {'id_kat': idKat, 'kategori': kategori, 'detail': detail};
  }
}
