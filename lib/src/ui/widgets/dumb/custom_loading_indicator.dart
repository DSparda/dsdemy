import 'package:flutter/material.dart';
import 'package:udemy1/src/app/utils/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 24.0),
        child: CircularProgressIndicator(
          backgroundColor: Constants.pink18,
          valueColor:
              AlwaysStoppedAnimation(Constants.blue),
        ),
      );
  }
}