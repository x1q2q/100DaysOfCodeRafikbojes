// using hive
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as en;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as pathp;
import 'package:hive/hive.dart';
import 'todoitem.dart' show Todoitem, TodoitemAdapter;

class HiveContoh extends StatefulWidget {
  @override
  _HiveContohState createState() => _HiveContohState();
}

class _HiveContohState extends State<HiveContoh> {
  static const kHiveFolder = 'hive';
  static const kHiveBoxNm = 'todoBox';

  Future<bool> _initDbFuture;

  @override
  void initState() {
    super.initState();
    this._initDbFuture = this._initDb();
  }

  Future<bool> _initDb() async {
    final dir = await pathp.getApplicationDocumentsDirectory();
    final hiveFolder = join(dir.path, kHiveFolder);
    Hive.init(hiveFolder);
    try {
      Hive.registerAdapter(TodoitemAdapter());
    } on HiveError catch (e) {
      print(e);
    }

    await Hive.openBox<Todoitem>(kHiveBoxNm);
    final List<Todoitem> todo = _getTodoitem();
    todo.forEach(print);
    return true;
  }

  @override
  void dispose() {
    Hive.box(kHiveBoxNm).compact();
    Hive.close();
    super.dispose();
  }

  List<Todoitem> _getTodoitem() {
    final box = Hive.box<Todoitem>(kHiveBoxNm);
    return box.values.toList();
  }

  Future<void> _addTodoitem(Todoitem todo) async {
    final box = Hive.box<Todoitem>(kHiveBoxNm);
    int key = await box.add(todo);
    todo.id = key;
    await todo.save();
    print('ditambahkan: key=$key, value=$todo');
  }

  Future<void> _toggleTodoitem(Todoitem todo) async {
    todo.isSelesai = !todo.isSelesai;
    await todo.save();
    print('diupdate: key=${todo.key}, value=$todo');
  }

  Future<void> _delTodoitem(Todoitem todo) async {
    todo.delete();
    print('didelete: key=${todo.id}, value=$todo');
  }

  Widget cardList(box) {
    return ListView(
      children: <Widget>[
        for (Todoitem item in box.values) _itemToListTile(item)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: this._initDbFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return Scaffold(
          body: ValueListenableBuilder<Box<Todoitem>>(
              valueListenable: Hive.box<Todoitem>(kHiveBoxNm).listenable(),
              builder: (ctx, box, _) => box.values.isEmpty
                  ? Center(child: Text('Data hive masih kosong'))
                  : cardList(box)),
          floatingActionButton: _buildActionBtn(),
        );
      },
    );
  }

  ListTile _itemToListTile(Todoitem todo) => ListTile(
      title: Text(todo.catatan,
          style: TextStyle(
              fontStyle: todo.isSelesai ? FontStyle.italic : null,
              color: todo.isSelesai ? Colors.grey : null,
              decoration: todo.isSelesai ? TextDecoration.lineThrough : null)),
      subtitle: Text('id=${todo.id}\n dibuat pada ${todo.tglBuat}'),
      isThreeLine: true,
      leading: IconButton(
        icon: Icon(
            todo.isSelesai ? Icons.check_box : Icons.check_box_outline_blank),
        onPressed: () => _toggleTodoitem(todo),
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete), onPressed: () => _delTodoitem(todo)));
  FloatingActionButton _buildActionBtn() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _addTodoitem(
          Todoitem(
            catatan: en.generateWordPairs().first.asPascalCase,
          ),
        );
      },
    );
  }
}
// rafikbojes, 09:59 13/07/2020
