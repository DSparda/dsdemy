import 'package:flutter/material.dart';
import 'package:udemy1/src/app/utils/constants.dart';

const _height = 50.0;
final _borderRadius = BorderRadius.circular(40.0);

class CustomContainer extends StatelessWidget {
  final double margin;
  final Widget child;
  final Color borderColor;
  final Color shadowColor;
  final widthPadding;

  const CustomContainer({
    Key key,
    this.margin = 12,
    this.child,
    this.borderColor = Constants.pink18,
    this.shadowColor = Constants.transparent, this.widthPadding = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final shadow = BoxShadow(
      color: shadowColor,
      blurRadius: 4,
      offset: Offset(2, 4),
    );
    return Container(
      width: size.width - widthPadding,
      height: _height,
      margin: EdgeInsets.only(bottom: margin),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: _borderRadius,
        border: Border.all(
          color: Constants.black54,
          width: 1.0,
        ),
        boxShadow: [shadow],
      ),
      child: child,
    );
  }
}
