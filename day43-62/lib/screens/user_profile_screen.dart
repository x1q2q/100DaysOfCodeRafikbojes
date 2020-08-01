import 'package:flutter/material.dart';
import 'package:konterapps/config/configs.dart';
import 'package:konterapps/data/user_detail.dart';
import 'package:konterapps/widgets/widgets.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<Map<String, dynamic>> userProfileContainer;

  @override
  void initState() {
    super.initState();
    userProfileContainer = [
      {'title': '', 'boxWidget': _boxProfil()},
    ];
  }

  Widget _boxProfil() {
    return Container(
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    image: DecorationImage(
                      image: AssetImage('assets/images/new_profile.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [Styles.boxColShdStyle],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Admin BojesCell', style: Styles.bTitleTextStyle),
                    Text('+(62)-857-999-992',
                        style: TextStyle(fontWeight: FontWeight.w100)),
                    Text('Purbalingga, Indonesia',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ))
              ],
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: AppColors.orange2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Lorem ipsum dolor site amet consescieutnum ' +
                      'Lorem ipsum dolor site amet consescieutnum ' +
                      'Lorem ipsum dolor site amet consescieutnum ' +
                      'Lorem ipsum dolor site amet consescieutnum ',
                ),
              ),
            )
          ],
        ));
  }

  Widget _boxStickSkill(double panjang, Color warna) {
    return Container(
      height: 15,
      width: panjang,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: warna),
    );
  }

  Widget _boxInformasi(double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: userDetails.length,
        itemBuilder: (BuildContext ctx, int id) {
          return Card(
            elevation: 0.0,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userDetails[id].skill),
                Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    _boxStickSkill(width, AppColors.green1),
                    _boxStickSkill(width * (userDetails[id].prsentase / 100),
                        AppColors.green3),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabAppBar(
        title: 'User Profile',
        tipe: 'userProfile',
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ContainerBoxRadius(containerPage: userProfileContainer),
          _boxInformasi(devWidth)
        ],
      )),
    );
  }
}
