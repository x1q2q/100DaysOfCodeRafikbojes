// using sq(f)lite
import 'dart:io';

import 'package:async/async.dart';
import 'package:english_words/english_words.dart' as en;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoItem {
  final int id;
  final String catatan;
  final bool isSelesai;
  final DateTime tglBuat;
  TodoItem({this.id, this.catatan, this.isSelesai = false, this.tglBuat});
  TodoItem.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'],
        catatan = map['catatan'],
        isSelesai = map['isSelesai'] == 1,
        tglBuat = DateTime.fromMillisecondsSinceEpoch(map['tglBuat']);
  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'catatan': catatan,
        'isSelesai': isSelesai ? 1 : 0,
        'tglBuat': tglBuat.millisecondsSinceEpoch
      };
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const kDbFileName = 'sqflite_ex.db';
  static const kDbTableName = 'catatan_db';
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  Database _db;
  List<TodoItem> _todo = [];

  Future<void> _initDB() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists())
      await Directory(dbFolder).create(recursive: true);
    final dbPath = join(dbFolder, kDbFileName);
    this._db = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $kDbTableName(
          id INTEGER PRIMARY KEY,
          isSelesai BIT NOT NULL,
          catatan TEXT,
          tglBuat INT
          ) 
        ''');
    });
  }

  Future<void> _getTodoItem(TodoItem todo) async {
    List<Map> jsons = await this._db.rawQuery('SELECT * FROM $kDbTableName');
    print('${jsons.length} row telah didapat ');
    this._todo = jsons.map((e) => TodoItem.fromJsonMap(e)).toList();
  }

  Future<void> _addTodoItem(TodoItem todo) async {
    await this._db.transaction((Transaction txn) async {
      int id = await txn.rawInsert('''
        INSERT INTO $kDbTableName 
        (catatan,isSelesai,tglBuat) 
        VALUES(
         "${todo.catatan}",
         ${todo.isSelesai ? 1 : 0},
         ${todo.tglBuat.millisecondsSinceEpoch}
        )
      ''');
      print('Ditambahkan todo dengan id=$id');
    });
  }

  Future<void> _toggleTodoItem(TodoItem todo) async {
    int count = await this._db.rawUpdate(
      ''' UPDATE $kDbTableName SET isSelesai=? WHERE id=?''',
      [todo.isSelesai ? 0 : 1, todo.id],
    );
    print('Diupdate todo $count');
  }

  Future<void> _delTodoItem(TodoItem todo) async {
    int count = await this
        ._db
        .rawDelete(''' DELETE FROM $kDbTableName WHERE id= ${todo.id}''');
    print('Dihapus todo $count');
  }

  Future<bool> _asyncInit() async {
    await _memoizer.runOnce(() async {
      await _initDB();
      await _getTodoItem();
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _asyncInit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == false)
          return Center(child: CircularProgressIndicator());
        return Scaffold(
          body: ListView(
            children: this._todo.map(_itemToListTile).toList(),
          ),
          floatingActionButton: _buildActionBtn(),
        );
      },
    );
  }

  Future<void> _updateUI() async {
    await _getTodoItem();
    setState(() {});
  }

  ListTile _itemToListTile(TodoItem todo) => ListTile(
        title: Text(todo.catatan,
            style: TextStyle(
                fontStyle: todo.isSelesai ? FontStyle.italic : null,
                color: todo.isSelesai ? Colors.grey : null,
                decoration:
                    todo.isSelesai ? TextDecoration.lineThrough : null)),
        subtitle: Text('id=${todo.id}\n dibuat pada ${todo.tglBuat}'),
        isThreeLine: true,
        leading: IconButton(
          icon: Icon(
              todo.isSelesai ? Icons.check_box : Icons.check_box_outline_blank),
          onPressed: () async {
            await _toggleTodoItem(todo);
            _updateUI();
          },
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await _delTodoItem(todo);
              _updateUI();
            }),
      );
  FloatingActionButton _buildActionBtn() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _addTodoItem(
          TodoItem(
            catatan: en.generateWordPairs().first.asPascalCase,
            tglBuat: DateTime.now(),
          ),
        );
        _updateUI();
      },
    );
  }
}
