import 'package:hive/hive.dart';
part 'todoitem.g.dart';

@HiveType()
class Todoitem extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String catatan;
  @HiveField(2)
  bool isSelesai;
  @HiveField(3)
  DateTime tglBuat;
  Todoitem({this.id, this.catatan, this.isSelesai = false, tglBuat})
      : this.tglBuat = tglBuat ?? DateTime.now();

  @override
  String toString() {
    return 'TodoItem(id=$id,catatan=$catatan,isSelesai=$isSelesai,tglBuat=$tglBuat)';
  }
}
// rafikbojes, 09:59 13/07/2020
