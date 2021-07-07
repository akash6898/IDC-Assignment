import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/customColors.dart';
import '../../Constants/textValues.dart';

class OnBoardTextColumn extends StatelessWidget {
  const OnBoardTextColumn(
      {Key? key, required this.textScaleFactor, required this.index})
      : super(key: key);

  final double textScaleFactor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextValues.text1[index],
          textScaleFactor: textScaleFactor,
          style: GoogleFonts.asap(
              fontSize: 19,
              color: (index % 2 != 0) ? CustomColor.white : CustomColor.blue),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TextValues.text2[index],
              textScaleFactor: textScaleFactor,
              style: GoogleFonts.asap(
                  fontSize: 40,
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
            width: 219,
            child: Text(
              TextValues.text3[index],
              textScaleFactor: textScaleFactor,
              style: GoogleFonts.roboto(
                  fontSize: 15,
                  color:
                      (index % 2 != 0) ? CustomColor.white : CustomColor.grey),
              softWrap: true,
              textAlign: TextAlign.justify,
            )),
      ],
    );
  }
}
