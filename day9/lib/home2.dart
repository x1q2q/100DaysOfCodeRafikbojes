import 'package:flutter/material.dart';

class Home2 extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home2>{
  int jmlCard = 1;
  bool evenNama = true;
  void _ubahNama(){
    setState(() {
      jmlCard++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER BEGINER"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: new List.generate(this.jmlCard, (index) => myLayoutWidget(index+1)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ubahNama,
        child:Icon(Icons.plus_one),
        tooltip: 'tambah card',
        ),
    );
  } 

  Widget myLayoutWidget(int indexs) {
    // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0,0,0,0.05),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    child: Column(
      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [
        // first row
        Row(
          children: [
            Text(
                'CARD KE-$indexs',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // second row (single item)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 0,
          ),
          child: Text('Dalam flutter—yang tentu karena kemudahannya—card'+
          'dapat sangat mudah untuk dibuat. & sudah membentuk dengan beragam varian. ',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Courgette Regular'
            ),
          ),
        ),

        // third row
        Row(
          children: [MaterialButton(
            color: Colors.white,
            child: Text('View More',style: TextStyle(
              color: Colors.teal,
            )),
            onPressed:(){},
          )],
        ),

      ],
    ),
  );
}
}
// rafikbojes, 11:44 PM, 09/06/2020