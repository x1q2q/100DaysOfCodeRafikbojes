class PktnAllpaketan {
  String idPktn;
  String namaPaketan;
  String hargaModal;
  String hargaJual;
  String laba;
  PktnAllpaketan(
      {this.idPktn,
      this.namaPaketan,
      this.hargaModal,
      this.hargaJual,
      this.laba});
  factory PktnAllpaketan.fromMap(Map<String, dynamic> map) {
    return PktnAllpaketan(
        idPktn: map['id_pktn'],
        namaPaketan: map['nama_pktn'],
        hargaModal: map['harga_modal'],
        hargaJual: map['harga_jual'],
        laba: map['laba']);
  }
  Map toJson() {
    return {
      'id_ptkn': idPktn,
      'nama_pktn': namaPaketan,
      'harga_modal': hargaModal,
      'harga_jual': hargaJual,
      'laba': laba
    };
  }
}
