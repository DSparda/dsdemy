import 'package:flutter/material.dart';
import 'package:udemy1/src/app/consts.dart';

const _height = 50.0;
const _widthPadding = 80.0;

class CustomTextField extends StatelessWidget {
  final double margin;
  final IconData icon;
  final String hint;
  final bool obsecure;

  const CustomTextField({
    Key key, this.margin = 12, this.icon, this.hint, this.obsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - _widthPadding,
      height: _height,
      margin: EdgeInsets.only(bottom: margin),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: pink18,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          color: black54,
          width: 1.0,
        ),
      ),
      child: TextField(
        obscureText: obsecure,
        decoration: InputDecoration(
            hintText: hint,
            icon: Icon(
              icon,
              color: black72,
            ),
            border: InputBorder.none),
      ),
    );
  }
}