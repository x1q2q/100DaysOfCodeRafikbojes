import 'package:flutter/material.dart';

class ContohDialog extends MaterialPageRoute<Null> {
  static Widget simpleDialog(context) {
    return RaisedButton.icon(
      color: Colors.teal[600],
      elevation: 0.2,
      icon: Icon(Icons.open_in_new, color: Colors.white),
      label: Text('Open Simple Dialog', style: TextStyle(color: Colors.white)),
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => SimpleDialog(
            title: const Text('Daftar Kontak'),
            children: [1, 2, 3]
                .map((e) => ListTile(
                      leading: Icon(Icons.supervisor_account),
                      title: Text('user$e@yahoo.com'),
                      onTap: () => Navigator.pop(context, 'user$e@yahoo.com'),
                    ))
                .toList(),
          ),
        ).then((returnVal) {
          if (returnVal.isNotEmpty) {
            print(returnVal + '##');
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('$returnVal telah dipilih'),
                action: SnackBarAction(label: 'OK', onPressed: () {})));
          }
        });
      },
    );
  }

  static Widget timePicker(ctx) {
    return RaisedButton.icon(
      color: Colors.red[600],
      elevation: 0.2,
      icon: Icon(Icons.open_in_new, color: Colors.white),
      label:
          Text('Open TimePicker Dialog', style: TextStyle(color: Colors.white)),
      onPressed: () {
        DateTime now = DateTime.now();
        showTimePicker(
                context: ctx,
                initialTime: TimeOfDay(hour: now.hour, minute: now.minute))
            .then((TimeOfDay val) {
          if (val != null) {
            Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text('waktu ${val.format(ctx)} telah dipilih'),
                action: SnackBarAction(label: 'OK', onPressed: () {})));
          }
        });
      },
    );
  }

  static Widget datePicker(ctx) {
    return RaisedButton.icon(
      color: Colors.indigo[600],
      elevation: 0.2,
      icon: Icon(Icons.open_in_new, color: Colors.white),
      label:
          Text('Open DatePicker Dialog', style: TextStyle(color: Colors.white)),
      onPressed: () {
        showDatePicker(
          context: ctx,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2040),
        ).then((DateTime val) {
          if (val != null) {
            Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text('tanggal $val.(ctx) telah dipilih'),
                action: SnackBarAction(label: 'OK', onPressed: () {})));
          }
        });
      },
    );
  }

  ContohDialog(String tipeDialog)
      : super(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Dialog Page'),
                elevation: 0.3,
              ),
              body: Center(
                child: tipeDialog == 'datePicker'
                    ? datePicker(context)
                    : tipeDialog == 'timePicker'
                        ? timePicker(context)
                        : simpleDialog(context),
              ));
        });
}
//rafikbojes, 11:15 PM 29/06/2020
