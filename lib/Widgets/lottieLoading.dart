import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  bool show;
  LottieLoading({required this.show});
  @override
  Widget build(BuildContext context) {
    return show
        ? Lottie.asset('images/loading.json',
            height: 40, width: double.infinity, alignment: Alignment.center)
        : Container();
  }
}
