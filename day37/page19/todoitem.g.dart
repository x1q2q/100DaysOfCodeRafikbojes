// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoitem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoitemAdapter extends TypeAdapter<Todoitem> {
  @override
  final typeId = 1;
  @override
  Todoitem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todoitem(
      id: fields[0] as int,
      catatan: fields[1] as String,
      isSelesai: fields[2] as bool,
    )..tglBuat = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Todoitem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catatan)
      ..writeByte(2)
      ..write(obj.isSelesai)
      ..writeByte(3)
      ..write(obj.tglBuat);
  }
}
