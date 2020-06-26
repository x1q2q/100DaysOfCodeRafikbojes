import 'package:flutter/material.dart';
import 'entry.dart';

class MyExpansionTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context,
        int index) => EntryItem(dataList[index]),
        itemCount: dataList.length,
      );
  }
}
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;
  
  Widget buildTiles(Entry root){
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      title: Text(root.title),
      key:PageStorageKey<Entry>(root),
      children: root.children.map(buildTiles).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildTiles(entry);
  }
}
// rafikbojes, 11:34 PM 26/06/2020