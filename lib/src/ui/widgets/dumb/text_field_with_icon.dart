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
    this.onChanged,
    this.inputType = TextInputType.text,
    this.backgroundColor = Constants.pink18,
  }) : super(key: key);

  final bool obsecure;
  final String hint;
  final IconData icon;
  final double margin;
  final TextInputType inputType;
  final Function(String) onChanged;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: backgroundColor,
      margin: margin,
      child: Padding(
        padding: icon != null
            ? EdgeInsets.only(left: 20.0)
            : EdgeInsets.only(left: 0),
        child: TextField(
          obscureText: obsecure,
          onChanged: onChanged,
          keyboardType: inputType,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.roboto(
                color: Constants.black45,
              ),
              icon: icon != null
                  ? Icon(
                      icon,
                      color: Constants.black54,
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
