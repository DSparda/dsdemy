import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/rounded_button.dart';
import 'package:udemy1/src/ui/widgets/dumb/tapable_text.dart';
import 'package:udemy1/src/ui/widgets/dumb/text_field_with_icon.dart';
import 'package:udemy1/src/ui/widgets/dumb/title_text.dart';
import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        final recognizer = TapGestureRecognizer()
          ..onTap = () => model..navToRegister();
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
                    TextFieldWithIcon(
                      hint: model.email,
                      icon: model.emailIcon,
                      inputType: TextInputType.emailAddress,
                      onChanged: model.emailChanged,
                    ),
                    TextFieldWithIcon(
                      hint: model.password,
                      icon: model.passwordIcon,
                      obsecure: true,
                      margin: 6,
                      onChanged: model.passwordChanged,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 44.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TapableText(
                          t1: model.forget1,
                          t2: model.forget2,
                          margin: 24,
                        ),
                      ),
                    ),
                    model.isLoading
                        ? Container(
                            margin: EdgeInsets.only(bottom: 24.0),
                            child: CircularProgressIndicator(
                              backgroundColor: Constants.pink18,
                              valueColor:
                                  AlwaysStoppedAnimation(Constants.blue),
                            ),
                          )
                        : RoundedButton(
                            text: model.buttonText,
                            press: model.login,
                            margin: 24.0,
                          ),
                    TapableText(
                      t1: model.signUp1,
                      t2: model.signUp2,
                      fontSize: 14,
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
