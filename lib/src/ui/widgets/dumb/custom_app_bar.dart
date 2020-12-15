import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

final _borderRadius = BorderRadius.vertical(bottom: Radius.circular(20.0));

class CustomAppBar extends PreferredSize {
  //
  final double height;
  final Color color;
  final String iconURL;
  final String name;

  CustomAppBar({
    this.name,
    this.iconURL = Constants.MALE_AVA_URL,
    this.color = Constants.pink,
    this.height = 200,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: _borderRadius,
        boxShadow: [
          BoxShadow(
            color: Constants.pink54,
            blurRadius: 4,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3.0,
                color: Constants.white,
              ),
            ),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(iconURL),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            this.name ?? Constants.DEFAULT_NAME,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
