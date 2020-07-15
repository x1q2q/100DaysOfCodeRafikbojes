import 'package:http/http.dart' as http;
import 'dart:convert';
import '../todolist.dart';

class TodolistEx {
  List<Todolist> parseBarang(String responseBody) {
    final parsed =
        json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parsed.map<Todolist>((json) => Todolist.fromMap(json)).toList();
  }

  Future<List<Todolist>> getTodo() async {
    try {
      final response =
          await http.get('http://192.168.43.56/bojescell_app/Api/todolist');
      return parseBarang(response.body);
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<Todolist> delTodo(String id) async {
    final response = await http.delete(
      'http://192.168.43.56/bojescell_app/Api/todolistdel/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Todolist.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('gagal delete');
    }
  }

  Future<Todolist> addTodo(Map<String, dynamic> data) async {
    final response = await http.post(
      'http://192.168.43.56/bojescell_app/Api/todolistadd/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_todo': null,
        'catatan': data['catatan'],
        'isSelesai': 'false',
        'tglBuat': data['tglBuat'],
      }),
    );
    if (response.statusCode == 200) {
      return Todolist.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('gagal insert');
    }
  }

  Future<Todolist> editTodo(Map<String, dynamic> data, String idTodo) async {
    final response = await http.put(
      'http://192.168.43.56/bojescell_app/Api/todolistedit/$idTodo',
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(<String, dynamic>{
        'catatan': data['catatan'],
        'tglBuat': data['tglBuat'],
        'isSelesai': data['isSelesai']
      }),
    );
    if (response.statusCode == 200) {
      return Todolist.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('gagal update:' + response.body.toString());
    }
  }
}
// rafikbojes, 08:00 AM 15/07/2020
