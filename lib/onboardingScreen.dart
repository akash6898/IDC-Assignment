import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/page1.dart';
import 'package:idc/page2.dart';
import 'package:idc/page3.dart';
import 'package:idc/page4.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> pages = [Page1(), Page2(), Page3(), Page4()];

  Widget? icon = Icon(Icons.arrow_back_ios_new_rounded);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
          builder: (context) => LiquidSwipe.builder(
              itemBuilder: (_, index) {
                return Padding(padding: EdgeInsets.only(left: 34,top: 69),child: Column(

                children: [
                  
                ],


                ),);
              },
              itemCount: 4,
              enableLoop: false,
              enableSideReveal: true,
              positionSlideIcon: 0.7,
              ignoreUserGestureWhileAnimating: true,
              slideIconWidget: icon,
              onPageChangeCallback: pageChangeCallback)),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      if (lpage == 3) {
        icon = null;
      } else {
        icon = Icon(Icons.arrow_back_ios_new_rounded);
      }
    });
  }
}
