import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/customColors.dart';

class BuildLoginOptions extends StatelessWidget {
  const BuildLoginOptions({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: new Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 250, 254, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 6,
                  color: CustomColor.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(14))),
                      primary:
                          Color.fromRGBO(255, 255, 255, 1), // background
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
            context, "/feed", (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          child: Image.asset("images/google.png"),
                        ),
                        Text(
                          "Continue with Google",
                          style: GoogleFonts.asap(
                              fontSize: 17,
                              color: Color.fromRGBO(87, 87, 87, 1)),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(14))),
                      primary:
                          Color.fromRGBO(255, 255, 255, 1), // background
                    ),
                    onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(
            context, "/feed", (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          child: Image.asset("images/facebook.png"),
                        ),
                        Text(
                          "Continue with Facebook",
                          style: GoogleFonts.asap(
                              fontSize: 17,
                              color: Color.fromRGBO(87, 87, 87, 1)),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "By selecting one or the other, you are agreeing to the",
                  style:
                      GoogleFonts.asap(color: Colors.grey, fontSize: 10),
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Terms of Services",
                    style: GoogleFonts.asap(
                      color: CustomColor.blue,
                      fontSize: 10,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " & ",
                    style: GoogleFonts.asap(
                      color: CustomColor.grey,
                      fontSize: 10,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: GoogleFonts.asap(
                      color: CustomColor.blue,
                      fontSize: 10,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ]))
              ],
            ),
          )),
    );
  }
}