import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class TambahNotes extends StatefulWidget {
  @override
  _TambahNotesState createState() => _TambahNotesState();
}

class _TambahNotesState extends State<TambahNotes> {
  final myController = new TextEditingController();
  List<Map<String, dynamic>> dataNotes = List();
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _loadSampleJson();
  }

  Future _loadSampleJson() async {
      String jsonString = await rootBundle.loadString("assets/contoh.json");
      final jsonData = await json.decode(jsonString);
      setState(() {
        for(int i=0;i<jsonData.length;i++){
          dataNotes.add(jsonData[i]);
        }
      });
  }
  void _openDialog(String txt){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: new Text('SUKSES TAMBAH DATA'),
        content: new Text('Anda berhasil menambahkan data $txt ke notes,'+
        'silakan buka halaman daftar notes & refresh'),
        actions:<Widget>[
          new FlatButton(onPressed:(){Navigator.of(context).pop();}, 
          child: Text('ok'))
        ]
      );
    });
  }
  Future tambahData() async{
    File jsonFile = await File('assets/contoh.json');
    setState(() {
      dataNotes.add({"notes":myController.text});  
    });
    await jsonFile.writeAsStringSync(json.encode(dataNotes));
    await _openDialog(myController.text);
    myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: myController,
                decoration:InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:BorderSide(
                      color: Colors.green[700],
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:BorderSide(
                      color: Colors.green[100]
                    )
                  ),
                  hintText:'Masukkan Notes..'
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton.icon(
                padding: EdgeInsets.fromLTRB(15.0,10.0,15.0,10.0),
                onPressed: myController.text == "" ? (){}:tambahData,
                label: Text('Submit',style: TextStyle(color:Colors.white)),
                icon: Icon(Icons.send,color: Colors.white,),
                color: Colors.green[700],
              )
            ],
          ),
    );
  }
}