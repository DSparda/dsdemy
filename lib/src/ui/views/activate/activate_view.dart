import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:udemy1/src/ui/widgets/dumb/description_text.dart';
import 'package:udemy1/src/ui/widgets/dumb/rounded_button.dart';
import 'package:udemy1/src/ui/widgets/dumb/text_field_with_icon.dart';
import 'package:udemy1/src/ui/widgets/dumb/title_text.dart';

import './activate_view_model.dart';

class ActivateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivateViewModel>.reactive(
      viewModelBuilder: () => ActivateViewModel(),
      builder: (
        BuildContext context,
        ActivateViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TitleText(
                          t1: model.title1,
                          t2: model.title2,
                          fontSize: 35,
                          letterSpacing: 2.5,
                        ),
                        DescriptionText(text: model.description),
                        TextFieldWithIcon(
                          hint: model.code,
                          margin: 24,
                          onChanged: model.codeChanged,
                        ),
                        model.isLoading
                            ? CustomLoadingIndicator()
                            : RoundedButton(
                                text: model.buttonText,
                                press: model.activate,
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
