// using sembast
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as en;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as pathp;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TodoItem {
  final int id;
  final String catatan;
  bool isSelesai;
  final DateTime tglBuat;
  TodoItem({this.id, this.catatan, this.isSelesai = false, this.tglBuat});

  TodoItem.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'],
        catatan = map['catatan'],
        isSelesai = map['isSelesai'],
        tglBuat = DateTime.fromMillisecondsSinceEpoch(map['tglBuat']);
  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'catatan': catatan,
        'isSelesai': isSelesai,
        'tglBuat': tglBuat.millisecondsSinceEpoch
      };
}

class SembastContoh extends StatefulWidget {
  @override
  _SembastContohState createState() => _SembastContohState();
}

class _SembastContohState extends State<SembastContoh> {
  static const kDbFileName = 'sembast_ex_.db';
  static const kDbStoreName = 'sembast_ex_store';

  Future<bool> _initDbFuture;
  Database _db;
  StoreRef<int, Map<String, dynamic>> _store;
  List<TodoItem> _todos = [];

  @override
  void initState() {
    super.initState();
    this._initDbFuture = _initDb();
  }

  Future<bool> _initDb() async {
    final dbFolder = await pathp.getApplicationDocumentsDirectory();
    final dbPath = join(dbFolder.path, kDbFileName);
    this._db = await databaseFactoryIo.openDatabase(dbPath);
    this._store = intMapStoreFactory.store(kDbStoreName);
    _getTodoItems();
    return true;
  }

  Future<void> _getTodoItems() async {
    final finder = Finder();
    final recSnapshot = await this._store.find(this._db, finder: finder);
    this._todos = recSnapshot
        .map((snapshot) => TodoItem.fromJsonMap({
              ...snapshot.value,
              'id': snapshot.key,
            }))
        .toList();
  }

  Future<void> _addTodoItem(TodoItem todo) async {
    int id = await this._store.add(this._db, todo.toJsonMap());
    print('database ditambahkan $id');
  }

  Future<void> _toggleTodoItem(TodoItem todo) async {
    todo.isSelesai = !todo.isSelesai;
    int count = await this._store.update(
          this._db,
          todo.toJsonMap(),
          finder: Finder(filter: Filter.byKey(todo.id)),
        );
    print('database terupdate $count');
  }

  Future<void> _delItem(TodoItem todo) async {
    int count = await this
        ._store
        .delete(this._db, finder: Finder(filter: Filter.byKey(todo.id)));
    print('database terdelete $count');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: this._initDbFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: ListView(
            children: this._todos.map(_itemToListTile).toList(),
          ),
          floatingActionButton: _buildActionBtn(),
        );
      },
    );
  }

  Future<void> _updateUI() async {
    await _getTodoItems();
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
              await _delItem(todo);
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
