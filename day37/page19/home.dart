// using hive
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as en;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as pathp;
import 'package:hive/hive.dart';
import 'package:widget_todo/page18/home.dart';
import 'todo_item.dart' show TodoItem, TodoItemAdapter;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      Hive.registerAdapter(TodoItemAdapter());
    } on HiveError catch (e) {
      print(e);
    }

    await Hive.openBox<TodoItem>(kHiveBoxNm);
    final List<TodoItem> todo = _getTodoItem();
    todo.forEach(print);
    return true;
  }

  @override
  void dispose() {
    Hive.box(kHiveBoxNm).compact();
    Hive.close();
    super.dispose();
  }

  List<TodoItem> _getTodoItem() {
    final box = Hive.box<TodoItem>(kHiveBoxNm);
    return box.values.toList();
  }

  Future<void> _addTodoItem(TodoItem todo) async {
    final box = Hive.box<TodoItem>(kHiveBoxNm);
    int key = await box.add(todo);
    todo.id = key;
    await todo.save();
    print('ditambahkan: key=$key, value=$todo');
  }

  Future<void> _toggleTodoItem(TodoItem todo) async {
    todo.isSelesai = !todo.isSelesai;
    await todo.save();
    print('diupdate: key=$key, value=$todo');
  }

  Future<void> _delTodoItem(TodoItem todo) async {
    todo.delet();
    print('didelete: key=${todo.id}, value=$todo');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return Scaffold(
          body: ValueListenableBuilder<Box<TodoItem>>(
            valueListenable: Hive.box<TodoItem>(kHiveBoxNm).listenable(),
            builder: (ctx, box, _) => ListView(
              children: <Widget>[
                for (TodoItem item in box.values) _itemToListTiel(item)
              ],
            ),
          ),
          floatingActionButton: _buildActionBtn(),
        );
      },
    );
  }

  ListTile _itemToListTile(TodoItem todo) => ListTile(
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
        onPressed: () => _toggleTodoItem(todo),
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete), onPressed: () => _delTodoItem(todo)));
  FloatingActionButton _buildActionBtn() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _addTodoItem(
          TodoItem(
            catatan: en.generateWordPairs().first.asPascalCase,
          ),
        );
      },
    );
  }
}
