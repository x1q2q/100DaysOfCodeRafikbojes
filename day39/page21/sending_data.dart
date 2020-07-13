import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendingData extends StatefulWidget {
  @override
  _SendingDataState createState() => _SendingDataState();
}

class _SendingDataState extends State<SendingData> {
  TextEditingController _titleCtrl;
  TextEditingController _contentCtrl;
  TextEditingController _userIdCtrl;
  String _respBody = '<empty>';
  String _err = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    this._contentCtrl = TextEditingController();
    this._titleCtrl = TextEditingController();
    this._userIdCtrl = TextEditingController();
    _reset();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        TextField(
          controller: this._titleCtrl,
          decoration:
              InputDecoration(labelText: 'Judul', border: OutlineInputBorder()),
        ),
        SizedBox(height: 4),
        TextField(
          controller: this._contentCtrl,
          decoration: InputDecoration(
              labelText: 'Konten', border: OutlineInputBorder()),
        ),
        SizedBox(height: 4),
        TextField(
          controller: this._userIdCtrl,
          decoration: InputDecoration(
              labelText: 'User ID', border: OutlineInputBorder()),
        ),
        SizedBox(height: 4),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text('POST'),
              color: Theme.of(context).accentColor,
              onPressed: _pending
                  ? null
                  : () => this._sendData(
                      _titleCtrl.text, _contentCtrl.text, _userIdCtrl.text),
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

  void _reset({bool resCtrl = true}) {
    setState(() {
      if (resCtrl) {
        this._titleCtrl.text = 'Contoh Judul';
        this._contentCtrl.text = 'Contoh Isi catatan..';
        this._userIdCtrl.text = '1';
      }
      String _respBody = '<empty>';
      String _err = '<none>';
      bool _pending = false;
    });
  }

  Future<void> _sendData(String title, String content, String uID) async {
    _reset(resCtrl: false);
    setState(() => this._pending = true);
    try {
      final http.Response resp = await http.post(
        'https://jsonplaceholder.typicode.com/posts',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{'title': title, 'body': content, 'userId': uID}),
      );
      if (resp.statusCode == 201) {
        setState(() => this._respBody = resp.body);
      } else {
        setState(() => this._err = 'Gagal meng-post error:' + resp.toString());
      }
    } catch (e) {
      setState(() => this._err = 'Gagal meng-post error: $e');
    }
    setState(() => this._pending = false);
  }
}
