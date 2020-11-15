import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'custom_container.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final widthPadding;

  const ButtonWithIcon({
    Key key,
    this.icon,
    this.text,
    this.widthPadding = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: Constants.white,
      shadowColor: Constants.black45,
      widthPadding: widthPadding,
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: FlatButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 1.0, color: Constants.black72)),
                  child: Icon(
                    icon,
                    color: Constants.black63,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: GoogleFonts.openSans(
                        color: Constants.black72,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
