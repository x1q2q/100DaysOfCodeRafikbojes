import 'package:flutter/material.dart';

class Sliverbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 130,
              floating: false,
              pinned:true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Arafik Bojes'),
                background: Image.asset('assets/img1.jpg', fit: BoxFit.cover)
              ),
            )
          ];
        },
        body: Center(child: Text('teks1'),)
      ),
    );
  }
}
// rafikbojes, 10:30 PM 28/06/2020