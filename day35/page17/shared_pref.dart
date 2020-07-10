import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  SharedPreferences _prefs;
  static const String kDemoNumberPrefKey = 'demo_number_pref';
  static const String kDemoBooleanPrefKey = 'demo_boolean_pref';
  int _numbPref = 0;
  bool _boolPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _loadNumbPref();
        _loadBoolPref();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(children: <Widget>[
          Text('Angka preferences'),
          Text('${this._numbPref}'),
          RaisedButton(
            child: Text('Penambahan'),
            onPressed: () => this._setNumPref(this._numbPref + 1),
          ),
        ]),
        TableRow(children: <Widget>[
          Text('Boolean preferences'),
          Text('${this._boolPref}'),
          RaisedButton(
            child: Text('Switch.Val'),
            onPressed: () => this._setBoolPref(!this._boolPref),
          ),
        ])
      ],
    );
  }

  void _loadNumbPref() => setState(
      () => this._numbPref = this._prefs.getInt(kDemoNumberPrefKey) ?? 0);

  void _loadBoolPref() => setState(
      () => this._boolPref = this._prefs.getBool(kDemoBooleanPrefKey) ?? false);

  Future<Null> _setNumPref(int val) async {
    await this._prefs.setInt(kDemoNumberPrefKey, val);
    _loadNumbPref();
  }

  Future<Null> _setBoolPref(bool val) async {
    await this._prefs.setBool(kDemoBooleanPrefKey, val);
    _loadBoolPref();
  }
}
