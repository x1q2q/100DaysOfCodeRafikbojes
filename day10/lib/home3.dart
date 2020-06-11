import 'package:flutter/material.dart';

class Home3 extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home3>{

  Map<String,String> heroImg = new Map();
  void _yesBtnConf(){
    setState(() {
      heroImg.addAll(
        {'${heroImg.length+1}':
        'Ini gambar opsi ke-${heroImg.length+1}'}
      );
    });
    Navigator.of(context).pop();
  }
  void _openDialog(){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: new Text('KONFIRMASI PENAMBAHAN'),
        content: new Text('Yakin untuk menambah gambar lagi, untuk saat ini?'),
        actions:<Widget>[
          new FlatButton(
            onPressed: _yesBtnConf,
            child:new Text('Yes')
          ),
          new FlatButton(onPressed:(){Navigator.of(context).pop();}, 
          child: new Text('Tidak'))
        ]
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER BEGINNER"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: new ListView(
        children: new List.generate(
          this.heroImg.length, 
          (index) => myLayoutWidget(index+1)
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDialog,
        child:Icon(Icons.card_giftcard),
        tooltip: 'tambah image',
        ),
    );
  } 

  Widget myLayoutWidget(int indexs) {
    // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(4.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0,0,0,0.05),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text('$indexs.)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img$indexs.jpg'),
              fit: BoxFit.cover,
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Text('${this.heroImg["$indexs"]}',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Courgette Regular'
            ),
          ),
        ),
      ],
    ),
  );
}

}
// rafikbojes, 07:28 AM, 11/06/2020