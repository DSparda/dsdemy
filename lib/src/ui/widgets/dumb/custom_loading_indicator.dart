import 'package:flutter/material.dart';
import 'package:udemy1/src/app/utils/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final height;

  const CustomLoadingIndicator({
    Key key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        margin: EdgeInsets.only(bottom: 24.0),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Constants.pink18,
            valueColor: AlwaysStoppedAnimation(Constants.blue),
          ),
        ),
      ),
    );
  }
}
