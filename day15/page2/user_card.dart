import 'package:flutter/material.dart';
import 'user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function delete;
  UserCard({this.user, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${user.id}',
                  style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  )
                ),
                RaisedButton(
                  child: Icon(Icons.remove_circle),
                  onPressed: delete,
                  color: Colors.grey[100],
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text('${user.title} - ${user.body}',
              style:TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
              )
            ),
          ],
        )
      )
    );
  }
}
// rafikbojes, 05:00 AM, 16/06/2020