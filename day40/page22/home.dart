import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'todolist.dart';
import 'services/todolist_ex.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final TodolistEx todo = TodolistEx();
  Future<List<Todolist>> futureTodolist;
  bool _pending = false;
  TextEditingController _txtCatatanCtrl;
  TextEditingController _txtDateCtrl;
  String updateStatus;

  @override
  void initState() {
    super.initState();
    futureTodolist = todo.getTodo();
    _txtCatatanCtrl = TextEditingController();
    _txtDateCtrl = TextEditingController();
  }

  void _updateUI() {
    futureTodolist = todo.getTodo();
    setState(() {});
  }

  void _reset({bool resCtrl = true}) {
    setState(() {
      if (resCtrl) {
        this._txtCatatanCtrl.text = '';
        this._txtDateCtrl.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.teal[300],
      ),
      body: FutureBuilder<List<Todolist>>(
          future: futureTodolist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List dtList = snapshot.data;
              if (dtList.isEmpty)
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('No item found...',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w300)),
                      Image.asset('assets/no-item.png')
                    ]);
              return ListView.builder(
                  itemCount: dtList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = {
                      'idTodo': dtList[index].idTodo,
                      'catatan': dtList[index].catatan,
                      'isSelesai': dtList[index].isSelesai,
                      'tglBuat': dtList[index].tglBuat
                    };
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          dtList[index].catatan,
                          style: TextStyle(
                              color: dtList[index].isSelesai == 'true'
                                  ? Colors.grey
                                  : null,
                              decoration: dtList[index].isSelesai == 'true'
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle:
                            Text('Dibuat pada ' + '${dtList[index].tglBuat}'),
                        isThreeLine: true,
                        leading: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _showModal(
                                tipe: 'edit', dataEdit: data, ctx: context)),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: _pending
                                ? null
                                : () => _confDelete(data, context)),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Container(
                margin: EdgeInsets.all(20),
                child: Text("${snapshot.error}",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: _btnAdd(context),
    );
  }

  Widget datePicker(BuildContext ctx) {
    return TextField(
        controller: _txtDateCtrl,
        onTap: () {
          showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2040),
          ).then((DateTime val) {
            if (val != null) {
              _txtDateCtrl.text = val.toString().substring(0, 19);
            }
          });
        },
        decoration: InputDecoration(hintText: "Masukkan Tanggal..."));
  }

  Widget selectStatus(BuildContext ctx, String status) {
    List<DropdownMenuItem<String>> dropDownItems = [
      const DropdownMenuItem(child: Text('Finished'), value: 'true'),
      const DropdownMenuItem(child: Text('Not-Finished'), value: 'false'),
    ];
    return DropdownButtonFormField(
      value: status,
      onChanged: (String newVal) {
        setState(() => this.updateStatus = newVal);
      },
      items: dropDownItems,
    );
  }

  _showModal(
      {Map<String, dynamic> dataEdit, BuildContext ctx, String tipe}) async {
    if (tipe == 'edit') {
      setState(() {
        _txtCatatanCtrl.text = dataEdit['catatan'];
        this.updateStatus = dataEdit['isSelesai'];
      });
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(tipe == 'add' ? 'Tambah Catatan' : 'Edit Catatan'),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _txtCatatanCtrl,
                    decoration:
                        InputDecoration(hintText: "Masukkan Catatan..."),
                  ),
                ]..add(tipe == 'add'
                    ? datePicker(context)
                    : selectStatus(ctx, dataEdit['isSelesai']))),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _reset();
                },
              ),
              new FlatButton(
                child: new Text(tipe == 'add' ? 'Submit' : 'Update'),
                onPressed: () async {
                  Map<String, dynamic> dataReady = {
                    'catatan': _txtCatatanCtrl.text,
                    'tglBuat': DateTime.now().toString()
                  };
                  if (tipe == 'add') {
                    dataReady['isSelesai'] = 'false';
                    await todo.addTodo(dataReady);
                  } else {
                    dataReady['isSelesai'] = this.updateStatus;
                    await todo.editTodo(dataReady, dataEdit['idTodo']);
                  }
                  _reset();
                  _updateUI();
                  Navigator.of(ctx).pop();
                },
              )
            ],
          );
        });
  }

  _confDelete(Map<String, dynamic> dataDel, BuildContext ctx) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi Hapus'),
            content:
                Text('Yakin untuk menghapus catatan: ${dataDel["catatan"]} ?'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _reset();
                },
              ),
              new FlatButton(
                child: new Text('Hapus'),
                onPressed: () async {
                  await todo.delTodo(dataDel['idTodo']);
                  _updateUI();
                  Navigator.of(ctx).pop();
                },
              )
            ],
          );
        });
  }

  FloatingActionButton _btnAdd(ctx) {
    return FloatingActionButton.extended(
      onPressed: () {
        _showModal(tipe: 'add', ctx: ctx);
      },
      label: Text('Add Todo'),
      icon: Icon(Icons.playlist_add),
    );
  }
}
// rafikbojes, 08:00 AM 15/07/2020
