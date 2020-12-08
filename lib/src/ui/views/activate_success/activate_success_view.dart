import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/description_text.dart';
import 'package:udemy1/src/ui/widgets/dumb/rounded_button.dart';
import 'package:udemy1/src/ui/widgets/dumb/title_text.dart';

import './activate_success_view_model.dart';

class ActivateSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivateSuccessViewModel>.reactive(
      viewModelBuilder: () => ActivateSuccessViewModel(),
      builder: (
        BuildContext context,
        ActivateSuccessViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(
                      t1: model.title1,
                      t2: model.title2,
                      fontSize: 35,
                      letterSpacing: 2.5,
                    ),
                    DescriptionText(text: model.description),
                    RoundedButton(
                      text: model.buttonText,
                      press: model.navToLogin,
                    )
                  ],
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
