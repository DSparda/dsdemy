import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionText extends StatelessWidget {
  final double margin;
  final String text;

  const DescriptionText({
    Key key,
    this.margin = 24,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: Text(
        text,
        style: GoogleFonts.montserrat(fontSize: 12, letterSpacing: 1.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
