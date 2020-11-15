import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class UserHomeViewModel extends BaseViewModel {
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
}
