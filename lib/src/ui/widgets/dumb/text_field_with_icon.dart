import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_container.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({
    Key key,
    this.obsecure = false,
    this.hint,
    this.icon,
    this.margin = 12,
  }) : super(key: key);

  final bool obsecure;
  final String hint;
  final IconData icon;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          obscureText: obsecure,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.roboto(
                color: Constants.black45,
              ),
              icon: Icon(
                icon,
                color: Constants.black54,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
