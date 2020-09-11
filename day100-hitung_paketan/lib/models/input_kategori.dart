import 'input_paketan.dart';

class InputKategori {
  String idKat;
  String kategori;
  List<InputPaketan> paketan;
  InputKategori({this.idKat, this.kategori, this.paketan});
  factory InputKategori.toMap(Map<String, dynamic> map) {
    return InputKategori(
        idKat: map['id_kat'],
        kategori: map['kategori'],
        paketan: map['paketan']
            .map<InputPaketan>((json) => InputPaketan.toMap(json))
            .toList());
  }
  Map toJson() {
    List<Map> paketans = this.paketan.map((i) => i.toJson()).toList();
    return {'id_kat': idKat, 'kategori': kategori, 'paketan': paketans};
  }
}
