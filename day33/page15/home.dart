import 'package:flutter/material.dart';
import 'webview_plugin.dart';
import 'markdown_render.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String valTipe;
  void initState() {
    super.initState();
    valTipe = 'Webview';
  }

  static const valItem = <String>[
    'Webview',
    'Markdown',
  ];
  final List<DropdownMenuItem<String>> listItem = valItem
      .map((String val) =>
          DropdownMenuItem<String>(value: val, child: Text(val)))
      .toList();

  Widget _dropdownBtn() {
    return DropdownButtonFormField(
      value: valTipe,
      onChanged: ((String vl) => setState(() => valTipe = vl)),
      items: listItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.orange[800],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          // child: WebviewPlugin(),
          child: MarkdownRender()),
    );
  }
}
// rafikbojes, 2:32 PM, 08/07/2020
