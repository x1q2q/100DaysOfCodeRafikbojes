import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../config/Configs.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget detailApps(BuildContext ctx) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        ListTile(
          tileColor: AppColors.grey1,
          leading: FlutterLogo(),
          title: Text('HitungPaketan Apps',
              style: Styles.contTxtStyle(Colors.black45)),
          subtitle: Text('@hitung_paketan'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Version'),
          subtitle: Text('0.1'),
        ),
        ListTile(
          leading: Icon(Icons.sync),
          title: Text('Changelog'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('License'),
        ),
      ],
    );
  }

  Widget detailAuth(BuildContext ctx) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        ListTile(
          tileColor: AppColors.grey1,
          leading: Text('Author', style: Styles.contTxtStyle(Colors.black45)),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Rafik Bojes'),
          subtitle: Text('Indonesia'),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Open Sites'),
        ),
      ],
    );
  }

  Widget detailCom(BuildContext ctx) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        ListTile(
          tileColor: AppColors.grey1,
          leading: Text('Company', style: Styles.contTxtStyle(Colors.black45)),
        ),
        ListTile(
          leading: Icon(Icons.apartment),
          title: Text('RafikBojes Inc.'),
          subtitle: Text('Android Apps Developer'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('53393, Pengadegan, Purbalingga, Jawa Tengah, Indonesia'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // var devSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.grey1,
        appBar: DefAppBar(
          tipe: 'about-app',
          title: 'About Apps',
        ),
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(children: <Widget>[
              ContWidgets(ttlCont: "", boxCont: this.detailApps(context)),
              ContWidgets(ttlCont: "", boxCont: this.detailAuth(context)),
              ContWidgets(ttlCont: "", boxCont: this.detailCom(context)),
            ])));
  }
}
