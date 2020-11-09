import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/consts.dart';

const _t1Color = black72;
const _t2Color = blue;

class TapableText extends StatelessWidget {
  final String t1;
  final String t2;
  final double fontSize;
  final double margin;

  const TapableText({
    this.t1,
    this.t2,
    this.fontSize = 12,
    this.margin = 0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: RichText(
        text: TextSpan(
          text: t1,
          style: GoogleFonts.openSans(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: _t1Color,
          ),
          children: <TextSpan>[
            TextSpan(
              text: t2,
              style: TextStyle(
                color: _t2Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
