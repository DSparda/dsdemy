import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

class AppBarWithBack extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 64.0,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 18.0,
          ),
          SvgPicture.asset(
            'assets/icons/arrow_back.svg',
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'Back',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: Constants.black54,
            ),
          )
        ],
      ),
    );
  }
}
