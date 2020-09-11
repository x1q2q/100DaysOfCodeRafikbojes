import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import '../data/data_profil.dart';

class ProfilUser extends StatefulWidget {
  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  @override
  void initState() {
    super.initState();
  }

  Widget profileUser() {
    const wtTxtSm = TextStyle(color: Colors.white);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/toko.jpg')),
            boxShadow: [Styles.boxCardShdStyle]),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          color: Color.fromRGBO(69, 44, 99, 0.55),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Card(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Image.asset('assets/images/user.jpg',
                              height: 120, width: 120))),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                        Text('BojesCell',
                            style: Styles.contTxtStyle(Colors.white)),
                        Text('10 Januari 2001', style: wtTxtSm),
                        SizedBox(height: 20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.home_filled, color: Colors.white),
                              Text(' Ngapak, Indonesia', style: wtTxtSm)
                            ])
                      ]))
                ],
              ),
              Divider(color: Colors.white60, thickness: 1.5),
              SizedBox(height: 10),
              Center(
                  child: SizedBox(
                      width: 160,
                      height: 45,
                      child: RaisedButton.icon(
                          color: AppColors.red3,
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(Icons.logout, color: Colors.white70),
                          label: Text('Keluar',
                              style: Styles.contTxtStyle(Colors.white70)))))
            ],
          ),
        ));
  }

  Widget strikeLine() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Divider(thickness: 5, color: AppColors.red01),
    );
  }

  Widget cardInfo() {
    return Container(
        margin: EdgeInsets.all(15),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: dataProfils.length,
            itemBuilder: (BuildContext context, int id) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12, width: 1.1)),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(dataProfils[id].icon,
                              size: 25, color: dataProfils[id].warna),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text(
                            dataProfils[id].jenis,
                            style: Styles.parTxtStyle,
                          ))
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(dataProfils[id].detail,
                                style: TextStyle(color: Colors.black54)),
                            Divider(
                                thickness: 0.7, color: dataProfils[id].warna),
                          ])
                    ],
                  ));
            }));
  }

  @override
  Widget build(BuildContext context) {
    // var devSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'profil',
          title: 'Profil',
          actBtn: null,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            this.profileUser(),
            this.strikeLine(),
            this.cardInfo(),
          ],
        )));
  }
}
