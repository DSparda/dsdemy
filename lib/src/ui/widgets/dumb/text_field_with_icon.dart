import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'custom_container.dart';

class TextFieldWithIcon extends StatefulWidget {
  const TextFieldWithIcon({
    Key key,
    this.obsecure = false,
    this.hint,
    this.icon,
    this.margin = 12,
    this.onChanged,
    this.inputType = TextInputType.text,
    this.backgroundColor = Constants.pink18,
    this.text = '',
  }) : super(key: key);

  final bool obsecure;
  final String hint;
  final IconData icon;
  final double margin;
  final TextInputType inputType;
  final Function(String) onChanged;
  final Color backgroundColor;
  final String text;

  @override
  _TextFieldWithIconState createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.text = widget.text;
    myController.addListener(() => widget.onChanged(myController.text));
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: widget.backgroundColor,
      margin: widget.margin,
      child: Padding(
        padding: widget.icon != null
            ? EdgeInsets.only(left: 20.0)
            : EdgeInsets.only(left: 0),
        child: TextField(
          controller: myController,
          obscureText: widget.obsecure,
          autofocus: true,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.roboto(
                color: Constants.black45,
              ),
              icon: widget.icon != null
                  ? Icon(
                      widget.icon,
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
