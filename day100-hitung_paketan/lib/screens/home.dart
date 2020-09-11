import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var devSize = MediaQuery.of(context).size;
    double heightIcon = devSize.width * .25;
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: DefAppBar(
        tipe: 'home',
        title: 'Hi, Rafik Bojes',
        actBtn: [
          MenuNav(
              func: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutApp())),
              icon: Icon(
                Icons.store,
                color: AppColors.red01,
              ))
        ],
      ),
      body: Stack(children: <Widget>[
        Container(
          height: devSize.height * .30,
          decoration: BoxDecoration(
              color: AppColors.red0,
              image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bg-header.png'))),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Align(
                    child: Row(children: <Widget>[
                  Expanded(
                      child: Text('HITUNG \nPAKETAN',
                          style: Styles.lgTxtStyle(Colors.white))),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 130,
                      width: 130,
                      child: SvgPicture.asset('assets/images/laptop.svg'))
                ])),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    MenuHome(
                        menu: 'Hitung',
                        asset: 'assets/images/iconhitung.png',
                        height: heightIcon,
                        func: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Hitung()))),
                    MenuHome(
                        menu: 'Statistik',
                        asset: 'assets/images/iconstats.png',
                        height: heightIcon,
                        func: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabStatistik()))),
                    MenuHome(
                        menu: 'Paketan',
                        asset: 'assets/images/iconpaketan.png',
                        height: heightIcon,
                        func: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Paketan()))),
                    MenuHome(
                        menu: 'Profil',
                        asset: 'assets/images/iconprofil.png',
                        height: heightIcon,
                        func: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilUser()))),
                  ],
                )),
                SizedBox(height: 20),
                Text('Made By Rafikbojes',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black26,
                      fontFamily: 'Cabin',
                    )),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class MenuHome extends StatelessWidget {
  const MenuHome({Key key, this.menu, this.asset, this.height, this.func})
      : super(key: key);
  final String menu;
  final String asset;
  final double height;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.ungu1,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [Styles.boxColShdStyle]),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: func,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    asset,
                    height: height,
                  ),
                  Spacer(),
                  Text(menu, style: Styles.bTitleTxtStyle),
                  Spacer()
                ],
              ),
            )));
  }
}
