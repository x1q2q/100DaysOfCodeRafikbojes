import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';

class TodoItem extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String catatan;
  @HiveField(2)
  bool isSelesai;
  @HiveField(3)
  final DateTime tglBuat;
  TodoItem({this.id, this.catatan, this.isSelesai = false, tglBuat})
      : this.tglBuat = tglBuat ?? DateTime.now();

  @override
  String toString() {
    // TODO: implement toString
    return 'TodoItem(id=$id,catatan=$catatan,isSelesai=$isSelesai,tglBuat=$tglBuat)';
  }
}
