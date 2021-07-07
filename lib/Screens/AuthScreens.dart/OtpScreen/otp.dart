import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/Constants/customColors.dart';
import 'package:idc/Widgets/lottieLoading.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import '../buildLoginOptions.dart';
import '../../../notifiers/auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool show = false;
  bool msg = false;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  String pin = "";
  bool _correctOtp = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColor.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildBackButton(context),
                Spacer(
                  flex: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: buildTitle(),
                    ),
                    SizedBox(
                      height: 68.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: buildPinPut(),
                    ),
                    buildLoadingAlertResend(context)
                  ],
                ),
                Spacer(
                  flex: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                            height: 250.h,
                            child: Image.asset('images/fingerprint.png'))),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _modalBottomSheetMenu();
                          },
                          child: Text("more login options",
                              style: GoogleFonts.asap(
                                fontSize: 13,
                                color: CustomColor.grey,
                              )),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: CustomColor.grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildLoadingAlertResend(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.h,
        ),
        LottieLoading(
          show: show,
        ),
        msg
            ? Container(
                padding: EdgeInsets.all(14),
                child: Text(_correctOtp ? "OTP Correct" : "OTP Incorret",
                    style: GoogleFonts.asap(
                        color:
                            _correctOtp ? CustomColor.green : CustomColor.red,
                        fontSize: 12)),
                color:
                    _correctOtp ? CustomColor.lightGreen : CustomColor.lightRed,
              )
            : SizedBox(
                height: 0,
              ),
        (show || msg)
            ? SizedBox(
                height: 0,
              )
            : SizedBox(
                height: 40.h,
              ),
        SizedBox(
          height: 25.h,
        ),
        Consumer<AuthProvider>(builder: (_, auth, __) {
          if (auth.remainingTime != 0) {
            return RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: "Resend OTP in ",
                style: GoogleFonts.asap(
                  color: CustomColor.grey,
                  fontSize: 10,
                ),
              ),
              TextSpan(
                text: "00:" + auth.remainingTime.toString().padLeft(2, '0'),
                style: GoogleFonts.asap(
                  color: CustomColor.blue,
                  fontSize: 10,
                ),
              ),
            ]));
          } else {
            return InkWell(
                onTap: () {
                  context.read<AuthProvider>().resend();
                },
                child: Text("Resend OTP",
                    style: GoogleFonts.asap(
                      color: CustomColor.blue,
                      fontSize: 10,
                    )));
          }
        }),
      ],
    );
  }

  PinPut buildPinPut() {
    return PinPut(
      fieldsCount: 6,
      onSubmit: (String pin) {
        verifyOtp(otp: pin);
      },
      eachFieldWidth: 10.w,
      focusNode: _pinPutFocusNode,
      keyboardType: TextInputType.number,
      controller: _pinPutController,
      textStyle:
          GoogleFonts.asap(color: Color.fromRGBO(74, 74, 74, 1), fontSize: 24),
      submittedFieldDecoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: msg
                      ? (_correctOtp ? CustomColor.green : CustomColor.red)
                      : CustomColor.blue))),
      selectedFieldDecoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: (msg)
                      ? (_correctOtp ? CustomColor.green : CustomColor.red)
                      : CustomColor.blue))),
      followingFieldDecoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: msg
                      ? (_correctOtp ? CustomColor.green : CustomColor.red)
                      : CustomColor.blue))),
    );
  }

  Column buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your",
          style: GoogleFonts.asap(
            color: CustomColor.white,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Enter OTP",
          style: GoogleFonts.asap(
            color: CustomColor.black,
            fontSize: 27,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Consumer<AuthProvider>(
          builder: (_, auth, __) => Text(
            "Please enter the verification code sent to ${auth.phoneNo}",
            style: GoogleFonts.asap(
              color: CustomColor.grey,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  Align buildBackButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new)),
    );
  }

  void verifyOtp({required String otp}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (show == false) {
      setState(() {
        show = true;
        msg = false;
      });
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        show = false;
        msg = true;
      });
      if (!context.read<AuthProvider>().checkOtp(otp: otp)) {
        Vibrate.feedback(FeedbackType.error);
        setState(() {
          _correctOtp = false;
        });
      } else {
        // Vibrate.feedback(FeedbackType.success);
        setState(() {
          _correctOtp = true;
        });

        await Future.delayed(Duration(seconds: 1));
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.of(context).pushReplacementNamed("/feed");
      }
    }
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (builder) {
          return BuildLoginOptions(context: context);
        });
  }
}
