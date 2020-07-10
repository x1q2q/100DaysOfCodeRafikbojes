// page untuk melihat data-data
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  String _respBody;
  String _err;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('data kosong..'),
    ));
  }

  Future<Null> _httpPut(String url, Map<String, dynamic> data) async {
    try {
      final http.Response resp = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, dynamic>{
            'userId': data['id'],
            'judul': data['judul'],
            'catatan': data['catatan']
          }));
      if (resp.statusCode == 201) {
        setState(() => this._respBody = resp.body);
      } else {
        setState(() => this._err = 'gagal mengupdate data: ' + resp.toString());
      }
    } catch (e) {
      setState(() => this._err = 'gagal mengupdate data: ' + e.toString());
    }
  }
}
