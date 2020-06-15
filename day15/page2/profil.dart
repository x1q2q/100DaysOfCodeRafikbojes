import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  void getDataFuture(){ // example async code
    
  }
  @override
  void initState(){
    super.initState();
    getDataFuture();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: SafeArea(
        child: Container(
          child:Center(
            child: Text('Ini halaman Profil!', 
            style:TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold)
            ),
          ),
        )
      ),
    );
  }
}
// rafikbojes, 07:33 PM, 15/06/2020