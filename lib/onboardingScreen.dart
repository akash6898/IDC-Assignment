import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/customColors.dart';
import 'package:idc/page1.dart';
import 'package:idc/page2.dart';
import 'package:idc/page3.dart';
import 'package:idc/page4.dart';
import 'package:idc/textValues.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int page = 0;
  Widget? icon =  Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color:  CustomColor.white)), child: Icon(Icons.arrow_back_ios_new_rounded,color: CustomColor.white,size: 12, ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
          builder: (context) => LiquidSwipe.builder(
              itemBuilder: (_, index) {
                return Scaffold(
                  backgroundColor:
                      (index % 2 == 0) ? CustomColor.white : CustomColor.blue,
                  body: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40, top: 69),
                              child: Image.asset(
                                TextValues.images[index],
                                height: 300,
                                width: 300,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 34, bottom: 100),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextValues.text1[index],
                                    style: GoogleFonts.asap(
                                        fontSize: 19,
                                        color: (index % 2 != 0)
                                            ? CustomColor.white
                                            : CustomColor.blue),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        TextValues.text2[index],
                                        style: GoogleFonts.asap(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColor.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      index < 3
                                          ? Image.asset(
                                              TextValues.images2[index],
                                              height: 40,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                      width: 229,
                                      child: Text(
                                        TextValues.text3[index],
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            color: (index % 2 != 0)
                                                ? CustomColor.white
                                                : CustomColor.grey),
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      index < 3 ? buildSkipButton(index) : Container(),
                      index == 3 ? buildNextButton() : Container(),
                      buildDots(index),
                    ],
                  ),
                );
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

  Positioned buildSkipButton(int index) {
    return Positioned(
        top: 48,
        right: 60,
        child: Text(
          "skip",
          style: GoogleFonts.asap(
              color: (index % 2 != 0) ? CustomColor.white : CustomColor.grey,
              fontSize: 16),
        ));
  }

  Positioned buildNextButton() {
    return Positioned(
        bottom: 50,
        right: 60,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: CustomColor.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              "Next",
              style: GoogleFonts.asap(color: Colors.white, fontSize: 14),
            ),
          ),
        ));
  }

  Positioned buildDots(int index) {
    return Positioned(
        bottom: 50,
        left: 26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  width: (i == index) ? 12 : 10,
                  height: (i == index) ? 12 : 10,
                  decoration: BoxDecoration(
                      color: (i == index)
                          ? (index % 2 == 0
                              ? CustomColor.blue
                              : CustomColor.white)
                          : (index % 2 != 0
                              ? CustomColor.blue
                              : CustomColor.white),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: (i == index)
                              ? (index % 2 != 0
                                  ? CustomColor.blue
                                  : CustomColor.white)
                              : (index % 2 == 0
                                  ? CustomColor.blue
                                  : CustomColor.white),
                          width: 0.5)),
                ),
              )
          ],
        ));
  }

  pageChangeCallback(int lpage) {
    setState(() {
      if (lpage == 3) {
        icon = null;
      } else {
        icon = Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: lpage%2 ==0? CustomColor.white :CustomColor.blue)), child: Icon(Icons.arrow_back_ios_new_rounded,color: lpage%2 ==0? CustomColor.white :CustomColor.blue,size: 12,));
      }
      page = lpage;
    });
  }
}
