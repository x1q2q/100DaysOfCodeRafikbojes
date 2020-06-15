import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  void getData() async{ // example async code
    // Future.delayed(Duration(seconds: 3),(){
    //   print('teks ini akan diprint setelah 3detik');
    // });
    // print('ini tampil pertama meskipun di baris setelah teks'); 
    String nm = await Future.delayed(Duration(seconds:3), (){
      return 'Bojes';
    });
    String nim = await Future.delayed(Duration(seconds: 1),(){
      return 'K359xx'; 
    });
    print('Mahasiswa bernama $nm dengan NIM $nim');
  }
  @override
  void initState(){
    super.initState();
    getData();
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
// rafikbojes, 05:00 AM, 16/06/2020