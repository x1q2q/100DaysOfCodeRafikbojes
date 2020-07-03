import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AmbilGambar extends StatefulWidget {
  @override
  _AmbilGambarState createState() => _AmbilGambarState();
}

class _AmbilGambarState extends State<AmbilGambar> {
  File _imgFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        OutlineButton.icon(
          icon: Icon(Icons.photo_album),
          onPressed: () async => await _ambilDariGaleri(),
          label: Text('Ambil dari Galeri'),
        ),
        OutlineButton.icon(
          icon: Icon(Icons.photo_camera),
          onPressed: () async => await _ambilDariKamera(),
          label: Text('Ambil dari Kamera'),
        ),
        this._imgFile == null ? Placeholder() : Image.file(this._imgFile)
      ],
    ));
  }

  Future<Null> _ambilDariGaleri() async {
    final PickedFile fileTerpilih =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imgFile = File(fileTerpilih.path));
  }

  Future<Null> _ambilDariKamera() async {
    final PickedFile fileTerpilih =
        await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imgFile = File(fileTerpilih.path));
  }
}
