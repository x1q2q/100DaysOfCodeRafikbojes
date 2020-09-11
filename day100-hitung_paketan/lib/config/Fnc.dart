import 'package:intl/intl.dart';

class Fnc {
  static const String urlAPI = 'http://192.168.43.56/hitungpaketan/Api/';
  // static const String urlAPI = 'http://localhost/hitungpaketan/Api/';
  static String rpForm(int angk) {
    return NumberFormat.simpleCurrency(locale: 'IDR').format(angk);
  }

  static String tglYMD([DateTime date]) {
    var tglFSkrg = DateFormat('yyyy-MM-dd');
    var tglFrom = date == null ? DateTime.now() : date;
    return tglFSkrg.format(tglFrom).toString();
  }
}
