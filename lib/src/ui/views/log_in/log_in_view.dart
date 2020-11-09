import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/ui/views/widgets/dumb_widgets/custom_text_field.dart';
import 'package:udemy1/src/ui/views/widgets/dumb_widgets/rounded_button.dart';
import 'package:udemy1/src/ui/views/widgets/dumb_widgets/tapable_text.dart';
import 'package:udemy1/src/ui/views/widgets/dumb_widgets/title_text.dart';
import './log_in_view_model.dart';

class LogInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogInViewModel>.nonReactive(
      viewModelBuilder: () => LogInViewModel(),
      builder: (
        BuildContext context,
        LogInViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        final recognizer = TapGestureRecognizer()
          ..onTap = () => model..navToLogOut();
        return Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SvgPicture.asset(
                        "assets/images/login_title.svg",
                        height: size.height * 0.25,
                      ),
                    ),
                    TitleText(
                      t1: model.title1,
                      t2: model.title2,
                      margin: 24.0,
                    ),
                    CustomTextField(
                      hint: model.email,
                      icon: model.emailIcon,
                    ),
                    CustomTextField(
                      hint: model.password,
                      icon: model.passwordIcon,
                      obsecure: true,
                      margin: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TapableText(
                          t1: model.forget1,
                          t2: model.forget2,
                          margin: 24,
                        ),
                      ),
                    ),
                    RoundedButton(
                      text: model.buttonText,
                      press: model.navToLogOut,
                      margin: 24.0,
                    ),
                    TapableText(
                      t1: model.signUp1,
                      t2: model.signUp2,
                      fontSize: 15,
                      recognizer: recognizer,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
