import 'package:flutter/material.dart';
import 'notes.dart';
class Home6 extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home6>{
  int jmlCard =3;
  List<Notes> catatan = [
    Notes(catatan: 'Sapu ruang tamu rumah!',deadline: 'jam 12 siang'),
    Notes(catatan: 'Makan siang di meja makan!',deadline: 'jam 2 siang'),
    Notes(catatan: 'Sapu bagian dapur rumah!',deadline: 'jam 5 sore'),
  ];
  void _addingCardNotes(){
    setState(() {
      this.jmlCard++;
      this.catatan.add(
        Notes(
          catatan: 'Jangan lupa tidur jam-${this.jmlCard}',
          deadline:'Jam berapa saja')
        );
    });
  }
  void _delItem(){
    setState(() {
      this.catatan.clear();
    });
  }

  Widget myNotesCard(q){
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(q.deadline,
                  style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  )
                ),
                RaisedButton(
                  child: Icon(Icons.remove_circle),
                  onPressed: _delItem,
                  color: Colors.grey[100],
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text(q.catatan,
              style:TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
              )
            ),
          ],
        )
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
  final deviceHeight = MediaQuery.of(context).size.height;
  final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beginner"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0.4,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        width: deviceWidth,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // children:catatan.map((q) => Text('${q.catatan} - ${q.deadline}')).toList(),
          children: catatan.map((q) => myNotesCard(q)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:_addingCardNotes,
        child:Icon(Icons.note_add),
        tooltip: 'tambah catatan',
        ),
    );
  }
}
// rafikbojes, 11:50 PM, 13/06/2020