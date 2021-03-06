import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/generated/router/router.gr.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/navigation_bundle.dart';

@singleton
class UserViewModel extends ReactiveViewModel {
  final navigationBundle = locator<NavigationBundle>();
  final navigationService = locator<NavigationService>();

  List<ReactiveServiceMixin> get reactiveServices => [navigationBundle];

  String get gender => navigationBundle.gender;
  String get avaURL =>
      this.gender == 'nam' ? Constants.MALE_AVA_URL : Constants.FEMALE_AVA_URL;

  String get name => navigationBundle.name;

  String _title = 'User Home Page';
  get title => _title;

  String _userProfile = 'Update Profile';
  get userProfile => _userProfile;

  IconData _userProfileIcon = Icons.person;
  get userProfileIcon => _userProfileIcon;

  String _avatar = 'Avatar';
  get avatar => _avatar;

  IconData _avatarIcon = Icons.image;
  get avatarIcon => _avatarIcon;

  String _security = 'Change Password';
  get security => _security;

  IconData _securityIcon = Icons.security;
  get securityIcon => _securityIcon;

  String _payment = 'Payment History';
  get payment => _payment;

  IconData _paymentIcon = Icons.payment;
  get paymentIcon => _paymentIcon;

  Future navToFeature() async {
    await navigationService.navigateTo(Routes.featureView);
  }

  Future navToUpdateUser() async {
    await navigationService.navigateTo(Routes.updateUserView);
  }
}
