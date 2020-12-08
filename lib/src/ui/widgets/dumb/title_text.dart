import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

const _t1Color = Constants.pink;
const _t2Color = Constants.black72;

class TitleText extends StatelessWidget {
  final String t1;
  final String t2;
  final double fontSize;
  final double margin;
  final double letterSpacing;

  const TitleText({
    this.t1,
    this.t2,
    this.fontSize = 45,
    this.margin = 0,
    Key key, this.letterSpacing = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: RichText(
        text: TextSpan(
          text: t1,
          style: GoogleFonts.anton(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: letterSpacing,
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
