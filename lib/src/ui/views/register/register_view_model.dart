import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:udemy1/src/app/locator/locator.dart';
import 'package:udemy1/src/app/router/router.gr.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  String _title1 = 'SIGN';
  get title1 => _title1;

  String _title2 = 'UP';
  get title2 => _title2;

  String _username = 'Username';
  get username => _username;

  IconData _userIcon = Icons.person_outline;
  get userIcon => _userIcon;

  String _gender = 'Gender';
  get gender => _gender;

  IconData _genderIcon = Icons.people_alt_outlined;
  get genderIcon => _genderIcon;

  String _phone = 'Phone number';
  get phone => _phone;

  IconData _phoneIcon = Icons.phone_outlined;
  get phoneIcon => _phoneIcon;

  String _email = 'Email';
  get email => _email;

  IconData _emailIcon = Icons.mail_outlined;
  get emailIcon => _emailIcon;

  String _password = 'Password';
  get password => _password;

  IconData _passwordIcon = Icons.lock_outline;
  get passwordIcon => _passwordIcon;

  String _buttonText = 'Sign up';
  get buttonText => _buttonText;

  String _signIn1 = 'Already have an account?';
  get signIn1 => _signIn1;

  String _signIn2 = ' Sign In';
  get signIn2 => _signIn2;

  Future navToLogin() async {
    await _navigationService.navigateTo(Routes.logInView);
  }
}
