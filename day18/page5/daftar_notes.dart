import 'package:flutter/material.dart';
import 'notes.dart';

class DaftarNotes extends StatefulWidget {
  @override
  _DaftarNotesState createState() => _DaftarNotesState();
}

class _DaftarNotesState extends State<DaftarNotes> {
  List<Map<String, dynamic>> dataNotes = List();

  @override
  void initState(){
    super.initState();
  }
  Widget listCard(){
    return ListView.builder(
      itemCount: dataNotes.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.green[100],
          margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
          child: ListTile(
            onTap: (){},
            contentPadding: EdgeInsets.all(5.0),
            leading: Icon(Icons.event_note),
            title: Text(dataNotes[index]['notes'],style:TextStyle(
                fontSize: 16.0,
                color:Colors.black45,
                fontWeight: FontWeight.bold
              )),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: dataNotes.isEmpty? Center(child:CircularProgressIndicator()): listCard()
    );
  }
}