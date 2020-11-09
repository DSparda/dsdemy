import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './log_out_view_model.dart';

class LogOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogOutViewModel>.nonReactive(
      viewModelBuilder: () => LogOutViewModel(),
      builder: (
        BuildContext context,
        LogOutViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Text(
              'hello',
            ),
          ),
        );
      },
    );
  }
}
