import 'package:flutter/material.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

const _width = 170.0;
const _height = 50.0;
final _borderRadius = BorderRadius.circular(40.0);

const _fontSize = 15.0;
const _fontWeight = FontWeight.w700;

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double margin;
  const RoundedButton({
    Key key,
    this.text,
    this.margin,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      margin: EdgeInsets.only(bottom: margin),
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        boxShadow: [
          BoxShadow(
            color: Constants.pink54,
            blurRadius: 4,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: FlatButton(
          color: Constants.pink,
          onPressed: press,
          child: Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: _fontSize,
              fontWeight: _fontWeight,
              color: Constants.white,
            ),
          ),
        ),
      ),
    );
  }
}
