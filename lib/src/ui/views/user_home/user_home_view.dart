import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/bottom_bar.dart';
import 'package:udemy1/src/ui/widgets/dumb/button_with_icon.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_app_bar.dart';
import './user_home_view_model.dart';

class UserHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserHomeViewModel>.nonReactive(
      viewModelBuilder: () => UserHomeViewModel(),
      builder: (
        BuildContext context,
        UserHomeViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: CustomAppBar(
            iconURL: model.avaURL,
            name: model.name,
          ),
          bottomNavigationBar: BottomBar(
            selected: 4,
          ),
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: Constants.gradientPink,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWithIcon(
                      icon: model.userProfileIcon,
                      text: model.userProfile,
                    ),
                    ButtonWithIcon(
                      icon: model.avatarIcon,
                      text: model.avatar,
                    ),
                    ButtonWithIcon(
                      icon: model.securityIcon,
                      text: model.security,
                    ),
                    ButtonWithIcon(
                      icon: model.paymentIcon,
                      text: model.payment,
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
