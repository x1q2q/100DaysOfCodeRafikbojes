import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  String namaMhs = 'rafik';
  bool evenNama = true;
  void _ubahNama(){
    setState(() {
      this.namaMhs= this.evenNama == true?'rafik':'bojes';
      this.evenNama = !this.evenNama; // switch value ketika menjalankan fungsi
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER BEGINER"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child:Text(namaMhs),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ubahNama,
        child:Icon(Icons.track_changes),
        tooltip: 'mengubah nama',
        backgroundColor: this.evenNama == true? Colors.purple:Colors.teal,
        ),
    );
  } 
}
// rafikbojes, 10:44 PM, 08/06/2020