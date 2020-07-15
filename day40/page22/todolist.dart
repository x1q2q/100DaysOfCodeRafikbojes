class Todolist {
  String idTodo;
  String catatan;
  String isSelesai;
  String tglBuat;
  Todolist({this.idTodo, this.catatan, this.isSelesai, this.tglBuat});
  factory Todolist.fromMap(Map<String, dynamic> map) {
    return Todolist(
        idTodo: map['id_todo'],
        catatan: map['catatan'],
        isSelesai: map['isSelesai'],
        tglBuat: map['tglBuat']);
  }
}
// rafikbojes, 08:00 AM 15/07/2020
