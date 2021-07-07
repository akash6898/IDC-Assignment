import 'package:flutter/material.dart';
import 'package:idc/Constants/textValues.dart';

class OnboardScreenImages extends StatelessWidget {
  OnboardScreenImages({
    Key? key,
    
    required this.index,
  }) : super(key: key);

  final int index;
  late double _screenwidth;
  late double _screenheight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _screenwidth = MediaQuery.of(context).size.width;
        _screenheight = MediaQuery.of(context).size.height;
        List<double> sizes = [];
        for (double i = 3000; i >= 400; i = i - 200) {
          sizes.add(i);
        }
        for (int i = 0; i < sizes.length; i++) {
          double he = sizes[i];
          double wi = he * 9 / 16;
          if (_screenwidth > wi && _screenheight > he) {
            return buildImage(height: he / 1.32 - 100, width: wi / 1.3 - 200);
          }
        }
        print("error");
        return buildImage(height: 50, width: 50);
      },
    );
  }

  Image buildImage({required double height, required double width}) {
    return Image.asset(
      TextValues.images[index],
      height: height,
      width: width,
    );
  }
}