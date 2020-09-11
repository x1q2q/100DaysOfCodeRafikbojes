import 'pktn_dtluntung.dart';

class PktnDtlpaketan {
  String idPktn;
  String namaPaketan;
  String kategori;
  String hargaModal;
  String hargaJual;
  String laba;
  String stokAwal;
  List<PktnDtluntung> hitungUntung;
  PktnDtlpaketan(
      {this.idPktn,
      this.namaPaketan,
      this.kategori,
      this.hargaModal,
      this.hargaJual,
      this.laba,
      this.stokAwal,
      this.hitungUntung});
  factory PktnDtlpaketan.fromMap(Map<String, dynamic> map) {
    return PktnDtlpaketan(
        idPktn: map['id_pktn'],
        namaPaketan: map['nama_pktn'],
        kategori: map['kategori'],
        hargaModal: map['harga_modal'],
        hargaJual: map['harga_jual'],
        laba: map['laba'],
        stokAwal: map['stok_awal'],
        hitungUntung: map['hitung_untung']
            .map<PktnDtluntung>((json) => PktnDtluntung.fromMap(json))
            .toList());
  }
  Map toJson() {
    List<Map> hitungUntungs = this.hitungUntung.map((i) => i.toJson()).toList();
    return {
      'id_ptkn': idPktn,
      'nama_pktn': namaPaketan,
      'kategori': kategori,
      'harga_modal': hargaModal,
      'harga_jual': hargaJual,
      'laba': laba,
      'stok_awal': stokAwal,
      'hitung_untung': hitungUntungs
    };
  }
}
