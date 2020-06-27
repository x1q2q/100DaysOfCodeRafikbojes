import 'package:flutter/material.dart';
import 'backdrop.dart';

class Sliverapp extends MaterialPageRoute<Null>{
  Sliverapp()
    :super(builder: (BuildContext context){
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned:true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Collapsing toolbar'),
                  background: Image.asset('assets/img1.jpg', fit: BoxFit.cover)
                ),
              )
            ];
          },
          body:Builder(
            builder: (BuildContext context) => Center(
              child: RaisedButton(
                onPressed: (){
                  Navigator.push<String>(context, Backdrop())
                  ..then((returnVal){
                    if(returnVal.isEmpty){
                      Scaffold.of(context).removeCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Kamu mengklik: $returnVal'),
                          action: SnackBarAction(
                            label: 'OK', onPressed: (){},
                          ),
                        ),
                      );
                    }
                  });
                },
                child:Text('Go to Backdrop')
              ) 
            ,)
          ), 
        )
      );
    });
  
}