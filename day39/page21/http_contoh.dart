import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpContoh extends StatefulWidget {
  @override
  _HttpContohState createState() => _HttpContohState();
}

class _HttpContohState extends State<HttpContoh> {
  String _respBody = '<kosong>';
  String _err;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[],
    );
  }

  Future<Null> _httpGet(String url, String apiToken) async {
    try {
      final http.Response resp = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: apiToken},
      );
      final parsed = await compute(jsonDecode, resp.body);
      print('$parsed the object parsed');
      setState(() => this._respBody = resp.body);
    } catch (e) {
      setState(() => this._err = e.toString());
    }
  }
}
