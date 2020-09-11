import 'package:flutter/material.dart';
import '../config/Configs.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPwd = true;
  @override
  void initState() {
    super.initState();
  }

  static const smallTxt = TextStyle(color: Colors.black54, fontSize: 14);
  void _goHome({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }

  Widget headerLogin() {
    return Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(top: 55),
        child: Column(children: <Widget>[
          ClipOval(
              child: Container(
                  padding: EdgeInsets.all(8),
                  color: AppColors.red01,
                  width: 100,
                  height: 100,
                  child: FlutterLogo())),
          SizedBox(height: 15),
          Text('Selamat Datang\ndi HitungPaketan',
              style: Styles.contTxtStyle(AppColors.red01)),
          SizedBox(height: 5),
          Text('Masuk untuk melanjutkan', style: smallTxt)
        ]));
  }

  Widget formLogin(BuildContext ctx) {
    return Container(
        padding: EdgeInsets.only(top: 45),
        margin: EdgeInsets.fromLTRB(55, 0, 55, 55),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              cursorColor: AppColors.ungu2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.ungu2, width: 2.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.red3,
                      width: 0.8,
                    ),
                  ),
                  labelStyle: Styles.parTxtStyle,
                  labelText: 'USERNAME'),
            ),
            SizedBox(height: 20),
            TextFormField(
              cursorColor: AppColors.ungu2,
              obscureText: _showPwd,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.ungu2, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.red3,
                    width: 0.8,
                  )),
                  labelStyle: Styles.parTxtStyle,
                  suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => this._showPwd = !this._showPwd),
                      icon: Icon(this._showPwd
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'PASSWORD'),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              child: RaisedButton.icon(
                  onPressed: () async {
                    _goHome(context: ctx, pageRef: Home());
                  },
                  color: AppColors.red3,
                  icon: Icon(Icons.login, color: Colors.white, size: 25),
                  label:
                      Text('MASUK', style: Styles.contTxtStyle(Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30))),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Hubungi Operator Untuk Mendapatkan Akun!',
                  style: smallTxt,
                  textAlign: TextAlign.center,
                ))
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.grey2,
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        this.headerLogin(),
        SizedBox(height: height / 4.5, child: Container(color: Colors.white)),
        this.formLogin(context)
      ])),
    ));
  }
}
