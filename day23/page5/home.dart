import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.6,
          backgroundColor: Colors.blueAccent,
        ),
        body:Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(
                        color: Colors.grey[300]
                      )
                    ),
                    filled: true,
                    icon: Icon(Icons.person),
                    hintText:'Masukkan Nama..',
                    labelText: 'Username *'
                  ),
                  onSaved: (String val){
                    // some code
                  },
                ),
                SizedBox(height:20.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(
                        color: Colors.grey[300]
                      )
                    ),
                    filled: true,
                    icon: Icon(Icons.email),
                    hintText:'Masukkan Email Pengguna..',
                    labelText: 'Email *'
                  ),
                  onSaved: (String val){
                    // some code
                  },
                ),
                SizedBox(height:20.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(
                        color: Colors.grey[300]
                      )
                    ),
                    filled: true,
                    icon: Icon(Icons.phone),
                    hintText:'Masukkan Nomor Handphone..',
                    labelText: 'No.HP *'
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String val){
                    // some code
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),        
          )       
    );
  }
}