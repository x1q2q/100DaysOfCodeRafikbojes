import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';
import 'package:konterapps/widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import '../data/jenis_barangs.dart';
import '../data/barang_sorotans.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double devHeight;
  double devWidth;
  List<Map<String, dynamic>> homeContainer;
  @override
  void initState() {
    super.initState();
    homeContainer = [
      {'title': 'Barang Terlaris', 'boxWidget': _boxTerlaris()},
      {'title': 'Jenis Barang', 'boxWidget': _boxJenis()}
    ];
  }

  Widget _boxTerlaris() {
    return Container(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: barangSorotans.length,
        itemBuilder: (BuildContext context, int id) {
          return Card(
              elevation: 0.0,
              margin: EdgeInsets.all(5),
              child: Container(
                width: this.devWidth / 2.8,
                decoration: BoxDecoration(
                  color: AppColors.orange1,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [Styles.boxColShdStyle],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: ClipOval(
                            child: Material(
                              color: Colors.black12,
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: barangSorotans[id].icon),
                            ),
                          )
                          // IconButton(
                          //     icon: barangSorotans[id].icon,
                          //     onPressed: null),
                          ),
                      Center(
                          child: Text(barangSorotans[id].nama,
                              style: Styles.bTitleTextStyle)),
                      Styles.btnRaisedStyle(
                          warna: AppColors.orange2,
                          title: 'Lihat Detail',
                          eventBtn: () {},
                          iconBtn: null)
                    ]),
              ));
        },
      ),
    );
  }

  Widget _boxJenis() {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: jenisBarangs.length,
      itemBuilder: (BuildContext ctx, int id) {
        return Card(
            elevation: 0.0,
            margin: EdgeInsets.all(0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: jenisBarangs[id].warna,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [Styles.boxColShdStyle],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: jenisBarangs[id].jenis,
                                  style: Styles.wTitleTextStyle,
                                  children: [
                                    TextSpan(text: '\n'),
                                    TextSpan(
                                        text: jenisBarangs[id].detail,
                                        style: TextStyle(fontSize: 14))
                                  ]),
                            ))),
                    Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(jenisBarangs[id].img)),
                        )),
                  ]),
            ));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    final double precHeight = 25;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TabAppBar(title: 'SikKonter', tipe: 'home'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: devHeight * (precHeight / 100),
                      child:
                          Lottie.asset('assets/lottiefiles/bluecommerce.json'),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            AppColors.green3,
                            AppColors.green2,
                            AppColors.green1,
                          ])),
                    ),
                    Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Hello BojesCell',
                            style: Styles.wTitleTextStyle,
                          ),
                        )),
                  ],
                ),
              ),
              ContainerBoxRadius(
                containerPage: this.homeContainer,
              ),
            ],
          ),
        ));
  }
}
