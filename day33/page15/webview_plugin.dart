import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewPlugin extends StatefulWidget {
  @override
  _WebviewPluginState createState() => _WebviewPluginState();
}

class _WebviewPluginState extends State<WebviewPlugin> {
  TextEditingController _txtCtrl;

  @override
  void initState() {
    super.initState();
    this._txtCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _txtCtrl.text = 'www.google.com';
    return Column(
      children: <Widget>[
        TextField(
          controller: this._txtCtrl,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan alamat URL..',
              labelText: 'URL dituju'),
        ),
        ButtonBar(
          children: <Widget>[
            OutlineButton.icon(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  this._openInWebView('http://${this._txtCtrl.text}');
                },
                icon: Icon(Icons.open_in_new),
                label: Text('OPEN'))
          ],
        )
      ],
    );
  }

  Future<Null> _openInWebView(String url) async {
    if (await canLaunch(url)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
              initialChild: Center(child: CircularProgressIndicator()),
              url: url,
              appBar: AppBar(title: Text(url))),
        ),
      );
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('$url tidak bisa di launch')));
    }
  }
}
