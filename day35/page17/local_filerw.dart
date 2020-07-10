import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathp;

class LocalFilerw extends StatefulWidget {
  @override
  _LocalFilerwState createState() => _LocalFilerwState();
}

class _LocalFilerwState extends State<LocalFilerw> {
  static const String kLocalFileNm = 'file_rw_demo_localfile.txt';
  final TextEditingController _txtCtrl = TextEditingController();
  String _localFileContent;
  String _localFilePath = kLocalFileNm;

  @override
  void initState() {
    super.initState();
    this._loadTxtFromLcFile();
    this._getLcFile()
      ..then((file) => setState(() => this._localFilePath = file.path));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode txtFocus = FocusNode();
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Text('Tulis File Lokal:'),
        TextField(
          focusNode: txtFocus,
          controller: _txtCtrl,
          maxLines: null,
        ),
        ButtonBar(
          children: <Widget>[
            MaterialButton(
              child: Text('Load'),
              onPressed: () async {
                this._loadTxtFromLcFile();
                this._txtCtrl.text = this._localFileContent;
                _showSnackBar('String sukses diload dari file lokal');
                FocusScope.of(context).requestFocus(txtFocus);
              },
            ),
            MaterialButton(
              child: Text('Save'),
              onPressed: () async {
                await this._writeTxtToLcFile(this._txtCtrl.text);
                this._txtCtrl.clear();
                _showSnackBar('String sukses ditulis pada file lokal');
                await this._loadTxtFromLcFile();
              },
            )
          ],
        ),
        Divider(height: 20),
        Text('Path FIle Lokal:'),
        Text(this._localFilePath, style: Theme.of(context).textTheme.caption),
        Divider(height: 20),
        Text('Isi Lokal FIle:'),
        Text(this._localFileContent,
            style: Theme.of(context).textTheme.caption),
      ],
    );
  }

  Future<File> _getLcFile() async {
    final dir = await pathp.getApplicationDocumentsDirectory();
    return File('${dir.path}/$kLocalFileNm');
  }

  Future<File> _writeTxtToLcFile(String txt) async {
    final file = await _getLcFile();
    return file.writeAsString(txt);
  }

  Future<Null> _loadTxtFromLcFile() async {
    String content;
    try {
      final file = await _getLcFile();
      content = await file.readAsString();
    } catch (e) {
      content = 'Error loading file lokal: $e';
    }
    setState(() => this._localFileContent = content);
  }

  void _showSnackBar(String txt) {
    Scaffold.of(this.context).showSnackBar(
      SnackBar(content: Text(txt), duration: Duration(milliseconds: 500)),
    );
  }
}
