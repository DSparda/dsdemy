import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:udemy1/src/app/locator/locator.dart';
import 'package:udemy1/src/app/router/router.gr.dart';

class LogInViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title1 = 'SIGN';
  get title1 => _title1;

  String _title2 = 'IN';
  get title2 => _title2;

  String _email = 'Email';
  get email => _email;

  IconData _emailIcon = Icons.mail_outlined;
  get emailIcon => _emailIcon;

  String _password = 'Password';
  get password => _password;

  IconData _passwordIcon = Icons.lock_outline;
  get passwordIcon => _passwordIcon;

  String _forget1 = 'Forget password? Click';
  get forget1 => _forget1;

  String _forget2 = ' here';
  get forget2 => _forget2;

  String _buttonText = 'Sign in';
  get buttonText => _buttonText;

  String _signUp1 = 'Don’t have an account?';
  get signUp1 => _signUp1;

  String _signUp2 = ' Sign Up';
  get signUp2 => _signUp2;

  Future navToRegister() async {
    await _navigationService.navigateTo(Routes.registerView);
  }

  Future navToUserHome() async {
    await _navigationService.navigateTo(Routes.userHomeView);
  }
}
