import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool progress= false;
  bool pwdOpt = true;

  String valOfLoginLevel;
  static const loginAsItem = <String>[
    'Sebagai Guru','Sebagai Murid'
  ];
  final List<DropdownMenuItem<String>> dropDownItems = loginAsItem
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        )
      ).toList();
    
  void _ubahProg(){
    setState(() {
      this.progress = !this.progress;
    });
  }
  Widget headerLogin(){
    return InkWell(
      splashColor: Colors.pink[700],
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text('LOGIN FORM',
            style: TextStyle(
              fontSize: 28,
            ))
          ]
        ),
      ),
    );
  }

  Widget selectAs(){
    return ListTile(
      title: Text('Pilih Login Level'),
      trailing: DropdownButton(
        value: valOfLoginLevel,
        onChanged: ((String newVal){
          setState(() {
            valOfLoginLevel=newVal;
          });
        }),
        items: dropDownItems,
      ),
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
        suffixIcon: Icon(Icons.email),
        hintText:'Masukkan Email Pengguna..',
      ),
      onSaved: (String val){
        // some code
      },
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
        hintText:'Masukkan Password..',
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
  Widget tombolLogin(){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton.icon(
          onPressed:_ubahProg, 
          label: Text('LOGIN'),
          icon:Icon(Icons.lock_open),
          color: Colors.pink[400],
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        )
      ],
    );
  }
  Widget afterSubmit(){
    if(this.progress){
      return LinearProgressIndicator();
    }else{
      return SizedBox();
    }
  }
  Widget boxCover(){
    return Stack(
      children: [
        Container(
          color: Colors.pink[400],
          height: 200,
        ),
        loginForm()
      ],
    );
  }
  Widget loginForm(){
    return Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              topLeft:Radius.circular(40.0),
              topRight:Radius.circular(40.0),
            )
          ),
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10,30,10,10),
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 15.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                headerLogin(),
                selectAs(),
                inputEmail(),
                inputPwd(),
                tombolLogin(),
                afterSubmit()
              ],
            )
          ),        
      ),
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
        body:Column(children: <Widget>[
          boxCover()
        ],),       
    );
  }
}