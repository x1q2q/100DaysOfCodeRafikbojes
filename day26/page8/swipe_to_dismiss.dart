import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  final items = List<String>.generate(10, (i) =>"List ke-${i + 1}");
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final String item = items[index];
        return Dismissible(
          key:Key(item),
          onDismissed:(DismissDirection dir){
            setState(() => this.items.removeAt(index));
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir == DismissDirection.startToEnd?'$item removed':'$item liked'),
                action: SnackBarAction(
                  label: 'UNDO', 
                  onPressed:(){ setState(() => this.items.insert(index,item));},
                )
              ),
            );
          },
          background: Container(
            alignment: Alignment.centerLeft,
            color: Colors.red[600],
            child:Icon(Icons.delete,color: Colors.white)
          ),
          secondaryBackground: Container(
            color:Colors.green[600],
            child:Icon(Icons.thumb_up,color: Colors.white),
            alignment:Alignment.centerRight,
          ),
          child:ListTile(
            title:Center(child:Text('${items[index]}'))
          )
        );
      },
      itemCount: items.length,
    );
  }
}
// rafikbojes, 11:34 PM 26/06/2020