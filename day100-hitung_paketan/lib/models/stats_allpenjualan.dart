class StatsAllpenjualan {
  String totalUntung;
  String totalHmodal;
  String totalHjual;
  String totalTerjual;
  String tgl;
  StatsAllpenjualan(
      {this.totalUntung,
      this.totalHmodal,
      this.totalHjual,
      this.totalTerjual,
      this.tgl});
  factory StatsAllpenjualan.fromMap(Map<String, dynamic> map) {
    return StatsAllpenjualan(
        totalUntung: map['total_untung'],
        totalHmodal: map['total_hmodal'],
        totalHjual: map['total_hjual'],
        totalTerjual: map['total_terjual'],
        tgl: map['tgl']);
  }
  Map toJson() {
    return {
      'total_untung': totalUntung,
      'total_hmodal': totalHmodal,
      'total_hjual': totalHjual,
      'total_terjual': totalTerjual,
      'tgl': tgl
    };
  }
}
