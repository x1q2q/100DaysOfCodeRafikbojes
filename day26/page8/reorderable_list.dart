import 'package:flutter/material.dart';

class ReorderableList extends StatefulWidget {
  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  static final items = <String>[
    'A','B','C','D','E','F','G'
  ].map((item)=>ListItem(item,false)).toList();
  void reOrder(int oldIndex, int newIndex){
    setState(() {
      if(newIndex > oldIndex) newIndex -=1;
      final ListItem item = items.removeAt(oldIndex);
      items.insert(newIndex,item);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final daftarList = items.map(
      (item) => CheckboxListTile(
        key: Key(item.value),
        value:item.checked ?? false,
        onChanged: (bool nV){
          setState(() {
            item.checked = nV;
          });
        },
        title:Text('Item ini adalah list ke-${item.value}'),
        isThreeLine: true,
        subtitle: Text('item ${item.value}, checked=${item.checked}'),
        secondary: Icon(Icons.drag_handle),
      ),
    ).toList();

    return ReorderableListView(
      onReorder:reOrder,
      children: daftarList,
    );
  }
}
class ListItem{
  ListItem(this.value,this.checked);
  final String value;
  bool checked;
}
// rafikbojes, 11:34 PM 26/06/2020