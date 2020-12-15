import 'package:flutter/material.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/generated/router/router.gr.dart';
import 'package:udemy1/src/app/models/login/login_request.dart';
import 'package:udemy1/src/app/models/login/login_response.dart';
import 'package:udemy1/src/app/models/register/register_error2.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';
import 'package:udemy1/src/services/login_api.dart';
import 'package:udemy1/src/ui/global/custom_base_viewmodel.dart';

class LoginViewModel extends CustomBaseViewModel {
  final _loginService = locator<LoginService>();

// #region Sign In Text
  String _title1 = 'SIGN';
  get title1 => _title1;

  String _title2 = 'IN';
  get title2 => _title2;
// #endregion

// #region Email
  String _email = 'Email';
  get email => _email;

  IconData _emailIcon = Icons.mail_outlined;
  get emailIcon => _emailIcon;

  String _emailValue;

  void emailChanged(String value) {
    _emailValue = value;
    notifyListeners();
  }
// #endregion

// #region Password
  String _password = 'Password';
  get password => _password;

  IconData _passwordIcon = Icons.lock_outline;
  get passwordIcon => _passwordIcon;

  String _passwordValue;

  void passwordChanged(String value) {
    _passwordValue = value;
    notifyListeners();
  }
// #endregion

// #region Forget Text
  String _forget1 = 'Forget password? Click';
  get forget1 => _forget1;

  String _forget2 = ' here';
  get forget2 => _forget2;
// #endregion

  String _buttonText = 'Sign in';
  get buttonText => _buttonText;

// #region Sign Up Text
  String _signUp1 = 'Don’t have an account?';
  get signUp1 => _signUp1;

  String _signUp2 = ' Sign Up';
  get signUp2 => _signUp2;
// #endregion

  void login() async {
    final request = LoginRequest(
      email: _emailValue,
      password: _passwordValue,
    );

    updateLoading(true);

    _loginService.login(request).catchError((e) {
      updateLoading(false);
      if (e is UnauthorisedException) {
        final eDecoded = RegisterError2.fromJson(e.toMap());
        dialogService.showDialog(
            title: e.prefix, description: eDecoded.message);
      } else {
        dialogService.showDialog(title: e.prefix, description: e.toString());
      }
    }).then((value) {
      updateLoading(false);
      if (value is LoginResponse) {
        navigationBundle.updateGender(value.gender);
        navigationBundle.updateName(value.name);
        navToUserHome();
      }
    });
  }

  Future navToRegister() async {
    await navigationService.navigateTo(Routes.registerView);
  }

  Future navToUserHome() async {
    await navigationService.navigateTo(Routes.userHomeView);
  }
}
