import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pwdOpt = true;
  int valJenKel;
  bool valRemember = false;
  List<Map<String,dynamic>> hobiItem = [
    {"nama":'Sepak Bola',"val":false},
    {"nama":'Bermain Catur',"val":false},
    {"nama":'Berenang',"val":false},
  ];
  Widget titleForm(){
    return Center(
      child: Text('FORM PENDAFTARAN',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.blue[700]
            )
      )
    );
  }
  Widget inputUname(){
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        enabledBorder:OutlineInputBorder(
          borderSide:BorderSide(
            color: Colors.grey[300])
        ),
        filled: true,
        icon: Icon(Icons.person),
        hintText:'Masukkan Nama Pengguna..',
        labelText: 'Nama *'
      ),
      onSaved: (String val){
        // some code
      },
    );
  }
  Widget inputEmail(){
    return TextFormField(
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
    );
  }
  Widget inputPhone(){
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(
            color: Colors.grey[300]
          ),
        ),
        icon: Icon(Icons.phone),
        hintText:'Masukkan Nomor Handphone..',
        labelText: 'No.HP'
      ),
      keyboardType: TextInputType.phone,
      onSaved: (String val){
        // some code
      },
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
    );
  }
  Widget inputAlamat(){
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(
            color: Colors.grey[300]
          )
        ),
        hintText:'Masukkan Alamat..',
        labelText: 'Alamat',
        helperText: 'ex. Jl. Mayjend Soengkono, Kalimanah, Purbalingga'
      ),
      maxLines: 2,
      onSaved: (String val){
        // some code
      },
    );
  }

  Widget pilihHobi(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: this.hobiItem.map((e) => 
        CheckboxListTile(
          title: Text(e['nama']),
          controlAffinity: ListTileControlAffinity.leading,
          value: e['val'], 
          onChanged: (bool val){
            setState(()=>e['val']=val);
          }
        )
      ).toList(),
    );
   
  }

  Widget pilihJenKel(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [{'jk':'laki-laki','n':0},
      {'jk':'perempuan','n':1}].map((e) =>
        RadioListTile<int>(
          title: Text(e['jk']),
          controlAffinity: ListTileControlAffinity.leading,
          value: e['n'],
          groupValue: this.valJenKel,
          onChanged: (int value){
            setState(() => this.valJenKel=value);
          },
        )).toList(),
    );
  }

  Widget rememberMe(){
    return SwitchListTile(
      title: Text('Automatically login?'),
      value: this.valRemember, 
      onChanged:(bool val){
        setState(() => this.valRemember=val);
      }
    );
  }

  Widget inputPwd(){
    return TextFormField(
      obscureText: this.pwdOpt,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(
            color: Colors.grey[300]
          )
        ),
        filled: true,
        hintText:'Masukkan Password..',
        labelText: 'Password',
        helperText: 'maksimum 10 karakter',
        suffixIcon: GestureDetector(
          onTap:(){
            setState(() {
              this.pwdOpt = !this.pwdOpt;
            });
          },
          child: Icon(this.pwdOpt? Icons.visibility:Icons.visibility_off)
        ),
      ),
      maxLength: 10,
      onSaved: (String val){
        // some code
      },
    );
  }
  Widget tombolSubmit(){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        OutlineButton(
          padding: EdgeInsets.all(10.0),
          onPressed: (){},
          child: Text('Reset',style: TextStyle(
            color: Colors.black54),),
        ),
        RaisedButton.icon(
          padding: EdgeInsets.all(10.0),
          onPressed: (){},
          label: Text('Submit'),
          icon: Icon(Icons.send),
          color: Colors.blue[700],
        )
      ],
    );
  }
  Widget labelForm(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Center(child:Text(text,style: TextStyle(
          fontSize: 20
        ))),
        Divider(thickness: 0/5,color: Colors.black26,),
               
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget'),
          centerTitle: true,
          elevation: 0.6,
          backgroundColor: Colors.blueAccent,
        ),
        body:SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 15.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    titleForm(),
                    inputUname(),
                    inputEmail(),
                    inputPhone(),
                    inputAlamat(),
                    labelForm("Pilih Hobi"),
                    pilihHobi(),
                    labelForm("Pilih Gender"),
                    pilihJenKel(),
                    inputPwd(),
                    rememberMe(),
                    tombolSubmit()
                  ],
                ),
              ),        
          ),
        )       
    );
  }
}
// rafikbojes, 08:00 AM 25/06/2020