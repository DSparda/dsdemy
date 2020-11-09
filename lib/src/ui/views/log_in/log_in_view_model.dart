import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LogInViewModel extends BaseViewModel {
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

  String _forget1 = 'Forget password? Click';
  get forget1 => _forget1;

  String _forget2 = ' here';
  get forget2 => _forget2;

  IconData _passwordIcon = Icons.lock_outline;
  get passwordIcon => _passwordIcon;

  String _buttonText = 'Sign in';
  get buttonText => _buttonText;

  String _signUp1 = 'Don’t have an account?';
  get signUp1 => _signUp1;

  String _signUp2 = ' Sign Up';
  get signUp2 => _signUp2;
}
