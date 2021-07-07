import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/customColors.dart';
import 'package:idc/Widgets/lottieLoading.dart';
import 'package:idc/notifiers/auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../buildLoginOptions.dart';

class PhoneNoSceen extends StatefulWidget {
  @override
  _PhoneNoSceenState createState() => _PhoneNoSceenState();
}

class _PhoneNoSceenState extends State<PhoneNoSceen> {
  TextEditingController _phoneNo = new TextEditingController();
  bool show = false;
  bool error = false;
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
                buildBckButton(context),
                SizedBox(
                  height: 30.h,
                ),
                Spacer(
                  flex: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: buildTitle(),
                    ),
                    SizedBox(
                      height: 68.h,
                    ),
                    buildPhoneFIeld(),
                   buildAlertLoadingSubmit(context)
                  ],
                ),
                Spacer(
                  flex: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: 250.h, child: Image.asset('images/girl.png')),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
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

  Column buildAlertLoadingSubmit(BuildContext context)  {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      LottieLoading(
                        show: show,
                      ),
                      error
                          ? Container(
                              // height: 40.h,
                              padding: EdgeInsets.all(14),
                              child: Text(
                                  "Please Enter a valid mobile number",
                                  style: GoogleFonts.asap(
                                      color: CustomColor.red, fontSize: 12)),
                              color: CustomColor.lightRed,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      (show || error)
                          ? SizedBox(
                              height: 0,
                            )
                          : SizedBox(
                              height: 40.h,
                            ),
                      SizedBox(
                        height: 25.h,
                      ),
                      InkWell(
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (show == false) {
                            String phoneNumber = _phoneNo.text;
                            setState(() {
                              show = true;
                              error = false;
                            });
                            await Future.delayed(Duration(seconds: 3));
                            setState(() {
                              show = false;
                            });
                            if (!isVaildPhoneNo(phoneNumber)) {
                              Vibrate.feedback(FeedbackType.error);
                              setState(() {
                                error = true;
                              });
                            } else {
                              context
                                  .read<AuthProvider>()
                                  .sendOtp(phoneNo: phoneNumber);
                              setState(() {
                                error = false;
                              });
                              Navigator.of(context).pushNamed('/otp');
                            }
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.blue,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CustomColor.white,
                              size: 24,
                            )),
                      ),
                    ],
                  );
  }

  Row buildPhoneFIeld() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "+91",
                          style: GoogleFonts.asap(
                            color: CustomColor.grey,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      IntrinsicWidth(
                        child: TextField(
                          controller: _phoneNo,
                          maxLength: 10,
                          style: GoogleFonts.asap(
                            color: CustomColor.grey,
                            fontSize: 18,
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "enter here",
                              isDense: true,
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5)),
                        ),
                      )
                    ],
                  );
  }

  Column buildTitle() {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter your",
                          style: GoogleFonts.asap(
                            color: CustomColor.blue,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Mobile Number",
                          style: GoogleFonts.asap(
                            color: CustomColor.black,
                            fontSize: 27,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "we will send you a One Time Password (OTP)",
                          style: GoogleFonts.asap(
                            color: CustomColor.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    );
  }

  Align buildBckButton(BuildContext context) {
    return Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        // barrierColor: Color.fromRGBO(0, 0, 0, 0.15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (builder) {
          return BuildLoginOptions(context: context);
        });
  }

  bool isVaildPhoneNo(String phone) {
    if (phone.length != 10) {
      return false;
    }
    for (int i = 0; i < phone.length; i++) {
      if (!_isNumeric(phone[i])) {
        return false;
      }
    }
    return true;
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
