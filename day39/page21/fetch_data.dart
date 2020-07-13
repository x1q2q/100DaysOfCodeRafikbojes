import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  TextEditingController _urlCtrl;
  String _respBody = '<empty>';
  String _err = '<none>';
  bool _pending = false;

  @override
  @override
  void initState() {
    super.initState();
    this._urlCtrl = TextEditingController()
      ..text = 'https://jsonplaceholder.typicode.com/posts/1';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        TextField(
          controller: this._urlCtrl,
          decoration: InputDecoration(
              labelText: 'URL (GET)', border: OutlineInputBorder()),
        ),
        SizedBox(height: 4),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text('GET'),
              color: Theme.of(context).accentColor,
              onPressed: _pending ? null : () => this._fetchData(_urlCtrl.text),
            ),
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('RESET'),
                onPressed: this._reset)
          ],
        ),
        Text('Response body=$_respBody'),
        Divider(),
        Text('Error=$_err')
      ],
    );
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._urlCtrl.text = 'https://jsonplaceholder.typicode.com/post/1';
      }
      this._respBody = '<empty>';
      this._err = '<none>';
      this._pending = false;
    });
  }

  Future<Null> _fetchData(String url) async {
    _reset();
    setState(() => this._pending = true);
    try {
      final http.Response resp = await http.get(
        url,
      );
      final parsed = await compute(jsonDecode, resp.body);
      print('$parsed the object parsed');
      setState(() => this._respBody = resp.body);
    } catch (e) {
      setState(() => this._err = e.toString());
    }
    setState(() => this._pending = false);
  }
}
