import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idc/Constants/customColors.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Center(
        child: Text("Feed",style: GoogleFonts.asap(fontSize: 24,color: CustomColor.black)
      ),),
    );
  }
}
