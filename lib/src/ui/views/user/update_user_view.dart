import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/ui/views/user/update_user_view_model.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_app_bar.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_dropdown.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:udemy1/src/ui/widgets/dumb/rounded_button.dart';
import 'package:udemy1/src/ui/widgets/dumb/text_field_with_icon.dart';

class UpdateUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateUserViewModel>.reactive(
      viewModelBuilder: () => UpdateUserViewModel(),
      builder: (
        BuildContext context,
        UpdateUserViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: CustomAppBar(
            iconURL: model.avaURL,
            name: model.nameNav,
          ),
          body: Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: (model.isBusy)
                    ? CircularProgressIndicator()
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWithIcon(
                              text: model.nameNav,
                              hint: model.username,
                              icon: model.userIcon,
                              inputType: TextInputType.name,
                              onChanged: model.usernameChanged,
                            ),
                            CustomDropdown(
                              hint: model.gender,
                              icon: model.genderIcon,
                              list: model.genders,
                              selected: model.genderNav,
                              onSelected: model.onGenderSelected,
                            ),
                            TextFieldWithIcon(
                              text: model.phoneNav,
                              hint: model.phone,
                              icon: model.phoneIcon,
                              inputType: TextInputType.phone,
                              onChanged: model.phoneChanged,
                            ),
                            TextFieldWithIcon(
                              text: model.descriptionNav,
                              hint: model.discription,
                              icon: model.discriptionIcon,
                              onChanged: model.discriptionChanged,
                            ),
                            TextFieldWithIcon(
                              text: model.addressNav,
                              hint: model.address,
                              icon: model.addressIcon,
                              onChanged: model.addressChanged,
                              margin: 24.0,
                            ),
                            model.isLoading
                                ? CustomLoadingIndicator()
                                : RoundedButton(
                                    text: model.update,
                                    press: model.updateProfile,
                                    margin: 24.0,
                                  ),
                            Text(
                              model.discriptionText,
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                                letterSpacing: 1.5,
                              ),
                            )
                          ],
                        ),
                      ),
              )),
        );
      },
    );
  }
}
