import 'package:flutter/material.dart';
import '../config/Configs.dart';
import 'package:lottie/lottie.dart';

class ContImgtxt extends StatelessWidget {
  const ContImgtxt({Key key, this.type, this.txt, this.loadData, this.img})
      : super(key: key);
  final String type;
  final String txt;
  final Function loadData;
  final bool img;
  static errTxt(String type) {
    return TextStyle(
      fontFamily: 'Cabin',
      fontSize: 17.0,
      color: type != 'loading'
          ? type == 'warning' ? Colors.amber : AppColors.red2
          : AppColors.ungu2,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
    );
  }

  String getType() {
    switch (this.type) {
      case 'warning-carilist':
        return 'assets/lottiefiles/empty1.json';
        break;

      case 'warning-datalist':
        return 'assets/lottiefiles/empty2.json';
        break;

      case 'error-koneksi':
        return 'assets/lottiefiles/error1.json';
        break;

      case 'error-datalist':
        return 'assets/lottiefiles/error3.json';
        break;

      default:
        return 'assets/lottiefiles/loading.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                txt,
                style: errTxt(type.substring(0, 7)),
                textAlign: TextAlign.center,
              ),
              if (img) Lottie.asset(getType(), width: 350),
              if (loadData != null)
                Styles.btnRaisedStyle(
                    warna: AppColors.red1,
                    txt: 'Refresh',
                    func: loadData,
                    rnd: 30,
                    icon: Icons.refresh),
            ]));
  }
}
