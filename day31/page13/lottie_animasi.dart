import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimasi extends StatelessWidget {
  const LottieAnimasi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/book.json'),
    );
  }
}
// rafikbojes, 10:54 03/07/2020
