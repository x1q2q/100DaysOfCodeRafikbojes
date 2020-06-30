import 'package:flutter/material.dart';
import 'contoh_dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final drawHeader = UserAccountsDrawerHeader(
      accountName: Text('Arafik NurF'),
      accountEmail: Text('arafiknurf@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 45.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.orange[500],
        ),
        CircleAvatar(
          child: Text('N'),
          backgroundColor: Colors.teal[500],
        )
      ],
    );
    final drawItem = ListView(
      children: <Widget>[
        drawHeader,
        ListTile(
          title: Text('SimpleDialog Page'),
          onTap: () => Navigator.of(context).push(ContohDialog('simpleDialog')),
        ),
        ListTile(
          title: Text('TimePickerDialog page'),
          onTap: () => Navigator.of(context).push(ContohDialog('timePicker')),
        ),
        ListTile(
          title: Text('DatePickerDialog page'),
          onTap: () => Navigator.of(context).push(ContohDialog('datePicker')),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.deepPurple,
          child:
              Text('Open BottomSheets', style: TextStyle(color: Colors.white)),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Colors.black54))),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          ListTile(
                            dense: false,
                            title: Text('ini bottom sheet'),
                          ),
                          ListTile(
                            dense: false,
                            title: Text('click ok untuk menutup'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
          },
        ),
      ),
      drawer: Drawer(child: drawItem),
    );
  }
}
//rafikbojes, 11:15 PM 29/06/2020
