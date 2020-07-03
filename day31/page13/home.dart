import 'package:flutter/material.dart';
import 'builder_animasi.dart';
import 'lottie_animasi.dart';
import 'lowlevel_animasi.dart';
import 'widget_animasi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String valAnimasi;
  void initState() {
    super.initState();
    valAnimasi = 'Animasi Builder';
  }

  static const animasiItem = <String>[
    'Animasi Builder',
    'Animasi Lottie',
    'Animasi LowLevel',
    'Animasi Widget'
  ];
  final List<DropdownMenuItem<String>> listItem = animasiItem
      .map((String val) =>
          DropdownMenuItem<String>(value: val, child: Text(val)))
      .toList();

  Widget _dropdownBtn() {
    return DropdownButtonFormField(
      value: valAnimasi,
      onChanged: ((String vl) => setState(() => valAnimasi = vl)),
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
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
                child: this.valAnimasi == 'Animasi Lottie'
                    ? LottieAnimasi()
                    : this.valAnimasi == 'Animasi LowLevel'
                        ? LowlevelAnimasi()
                        : this.valAnimasi == 'Animasi Widget'
                            ? WidgetAnimasi()
                            : BuilderAnimasi()),
            _dropdownBtn()
          ],
        ),
      ),
    );
  }
}
// rafikbojes, 10:54 03/07/2020
