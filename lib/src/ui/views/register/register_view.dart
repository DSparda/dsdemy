import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_dropdown.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_text_field.dart';
import 'package:udemy1/src/ui/widgets/dumb/rounded_button.dart';
import 'package:udemy1/src/ui/widgets/dumb/title_text.dart';
import 'package:udemy1/src/ui/widgets/dumb/tapable_text.dart';

import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (
        BuildContext context,
        RegisterViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        final recognizer = TapGestureRecognizer()
          ..onTap = () => model..navToLogin();
        return Scaffold(
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
                        margin: 36,
                      ),
                      CustomTextField(
                        hint: model.username,
                        icon: model.userIcon,
                      ),
                      CustomDropdown(
                        hint: model.gender,
                        icon: model.genderIcon,
                        list: model.genders,
                        selected: model.selectedGender,
                        onSelected: model.onGenderSelected,
                      ),
                      CustomTextField(
                        hint: model.phone,
                        icon: model.phoneIcon,
                      ),
                      CustomTextField(
                        hint: model.email,
                        icon: model.emailIcon,
                      ),
                      CustomTextField(
                        hint: model.password,
                        icon: model.passwordIcon,
                        margin: 36.0,
                      ),
                      RoundedButton(
                        text: model.buttonText,
                        press: () {},
                        margin: 36.0,
                      ),
                      TapableText(
                        t1: model.signIn1,
                        t2: model.signIn2,
                        fontSize: 14,
                        recognizer: recognizer,
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
