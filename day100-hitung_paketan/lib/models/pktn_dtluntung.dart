class PktnDtluntung {
  String idKtgn;
  String idPktn;
  String namaPktn;
  String untung;
  String hModal;
  String hJual;
  String terjual;
  String tgl;
  PktnDtluntung(
      {this.idKtgn,
      this.idPktn,
      this.namaPktn,
      this.untung,
      this.hModal,
      this.hJual,
      this.terjual,
      this.tgl});
  factory PktnDtluntung.fromMap(Map<String, dynamic> map) {
    return PktnDtluntung(
      idKtgn: map['id_ktgn'],
      idPktn: map['id_pktn'],
      namaPktn: map['nama_pktn'],
      untung: map['untung'],
      hModal: map['hmodal'],
      hJual: map['hjual'],
      terjual: map['terjual'],
      tgl: map['tgl'],
    );
  }
  Map toJson() {
    return {
      'id_ktgn': idKtgn,
      'id_pktn': idPktn,
      'nama_pktn': namaPktn,
      'untung': untung,
      'hmodal': hModal,
      'hjual': hJual,
      'terjual': terjual,
      'tgl': tgl
    };
  }
}
