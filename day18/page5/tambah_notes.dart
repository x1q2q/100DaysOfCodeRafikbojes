import 'package:arkipelago_dev/page5/daftar_notes.dart';
import 'package:flutter/material.dart';

class TambahNotes extends StatefulWidget {
  @override
  _TambahNotesState createState() => _TambahNotesState();
}

class _TambahNotesState extends State<TambahNotes> {
  final myController = new TextEditingController();
  
  void _tambahData(){
    setState(() {
      DaftarNotes();      
    });
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: ,
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
                onPressed: _tambahData,
                label: Text('Submit',style: TextStyle(color:Colors.white)),
                icon: Icon(Icons.send,color: Colors.white,),
                color: Colors.green[700],
              )
            ],
          ),
    );
  }
}