import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/Constants/customColors.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onBoardTextColumn.dart';
import 'onboardScreenImages.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int page = 0;
  Widget? icon = Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: CustomColor.white)),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: CustomColor.white,
        size: 12,
      ));

  late double textScaleFactor;


  @override
  Widget build(BuildContext context) {
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
    
    return SafeArea(
      child: Builder(
          builder: (context) => LiquidSwipe.builder(
              itemBuilder: (_, index) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
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
                              padding: EdgeInsets.only(left: 10, top: 69.h,right: 30),
                              child: OnboardScreenImages(
                                index: index,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 34),
                              child: OnBoardTextColumn(
                                textScaleFactor: textScaleFactor,
                                index: index,
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
        top: 48.h,
        right: 60,
        child: InkWell(
          onTap: () {
            goNextScreen();
          },
          child: Text(
            "skip",
            textScaleFactor: textScaleFactor,
            style: GoogleFonts.asap(
                color: (index % 2 != 0) ? CustomColor.white : CustomColor.grey,
                fontSize: 16),
          ),
        ));
  }

  Positioned buildNextButton() {
    return Positioned(
        bottom: 26.h,
        right: 60,
        child: GestureDetector(
          onTap: () {
            goNextScreen();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: CustomColor.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "Next",
                textScaleFactor: textScaleFactor,
                style: GoogleFonts.asap(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ));
  }

  Positioned buildDots(int index) {
    return Positioned(
        bottom: 30.h,
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
        icon = Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color:
                        lpage % 2 == 0 ? CustomColor.white : CustomColor.blue)),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: lpage % 2 == 0 ? CustomColor.white : CustomColor.blue,
              size: 12,
            ));
      }
      page = lpage;
    });
  }

  void goNextScreen() {
    Navigator.pushNamed(context, '/phoneNo');
  }
}
