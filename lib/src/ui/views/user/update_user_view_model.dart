import 'package:flutter/material.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/register/register_error2.dart';
import 'package:udemy1/src/app/models/user/update_profile_request.dart';
import 'package:udemy1/src/app/models/user/update_profile_response.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/user_api.dart';
import 'package:udemy1/src/ui/views/register/register_view_model.dart';

class UpdateUserViewModel extends RegisterViewModel {
  final _userService = locator<UserService>();
  String get genderNav => navigationBundle.gender;
  String get avaURL =>
      this.genderNav == 'Male' ? Constants.MALE_AVA_URL : Constants.FEMALE_AVA_URL;

  String get nameNav => navigationBundle.name;

  String get phoneNav => navigationBundle.phone;
  String get descriptionNav => navigationBundle.description;
  String get addressNav => navigationBundle.address;

  String _discription = 'Discription';
  get discription => _discription;

  String _update = 'Update';
  get update => _update;

  IconData _discriptionIcon = Icons.event_note_outlined;
  get discriptionIcon => _discriptionIcon;

  String _descriptionValue;
  get descriptionValue => _descriptionValue;

  void discriptionChanged(String value) {
    _descriptionValue = value;
    notifyListeners();
  }

  String _address = 'Address';
  get address => _address;

  IconData _addressIcon = Icons.location_on_outlined;
  get addressIcon => _addressIcon;

  String _addressValue;
  get addressValue => _addressValue;

  void addressChanged(String value) {
    _addressValue = value;
    notifyListeners();
  }

  String _discriptionText = 'update personal information about you';
  get discriptionText => _discriptionText;

  void updateProfile() {
    final request = UpdateProfileRequest(
        name: usernameValue == null ? nameNav : usernameValue,
        gender: selectedGender == null ? genderNav : selectedGender,
        phone: phoneValue == null ? phoneNav : phoneValue,
        description:
            descriptionValue == null ? descriptionNav : descriptionValue,
        address: addressValue == null ? addressNav : addressValue);

    updateLoading(true);

    _userService.updateProfile(request).catchError((e) {
      if (e is BadRequestException) {
        final eDecoded = RegisterError2.fromJson(e.toMap());
        dialogService.showDialog(
            title: e.prefix, description: eDecoded.message);
      } else {
        dialogService.showDialog(
          title: 'hello',
          description: e.toString(),
        );
      }
    }).then((value) async {
      updateLoading(false);
      if (value is UpdateProfileResponse) {
        navigationBundle
          ..updateAddress(request.address)
          ..updateDescription(request.description)
          ..updateGender(request.gender)
          ..updateName(request.name)
          ..updatePhone(request.phone);
        var response = await dialogService.showDialog(
            title: Constants.SUCCESS,
            description: Constants.UPDATE_PROFILE_SUCCESS);
        if (response.confirmed == true) navToUser();
      }
    });
  }

  void navToUser() {
    navigationService.back();
  }
}
