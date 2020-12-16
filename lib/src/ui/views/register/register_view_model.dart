import 'package:flutter/material.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/generated/router/router.gr.dart';
import 'package:udemy1/src/app/models/register/register_error1.dart';
import 'package:udemy1/src/app/models/register/register_error2.dart';
import 'package:udemy1/src/app/models/register/register_request.dart';
import 'package:udemy1/src/app/models/register/register_response.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';
import 'package:udemy1/src/services/register_api.dart';
import 'package:udemy1/src/ui/global/custom_base_viewmodel.dart';

class RegisterViewModel extends CustomBaseViewModel {
  final _registerService = locator<RegisterService>();

// #region Title Text
  String _title1 = 'SIGN';
  get title1 => _title1;

  String _title2 = 'UP';
  get title2 => _title2;
// #endregion

// #region Username
  String _username = 'Username';
  get username => _username;

  IconData _userIcon = Icons.person_outline;
  get userIcon => _userIcon;

  String _usernameValue;
  get usernameValue => _usernameValue;

  void usernameChanged(String value) {
    _usernameValue = value;
    notifyListeners();
  }
// #endregion

// #region Gender
  String _gender = 'Gender';
  get gender => _gender;

  IconData _genderIcon = Icons.people_alt_outlined;
  get genderIcon => _genderIcon;

  List<String> _genders = <String>['Male', 'Female'];
  get genders => _genders;

  String _selectedGender;
  get selectedGender => _selectedGender;

  void onGenderSelected(dynamic value) {
    _selectedGender = value;
    notifyListeners();
  }
// #endregion

// #region Phone
  String _phone = 'Phone number';
  get phone => _phone;

  IconData _phoneIcon = Icons.phone_outlined;
  get phoneIcon => _phoneIcon;

  String _phoneValue;
  get phoneValue => _phoneValue;

  void phoneChanged(String value) {
    _phoneValue = value;
    notifyListeners();
  }
// #endregion

// #region Email
  String _email = 'Email';
  get email => _email;

  IconData _emailIcon = Icons.mail_outlined;
  get emailIcon => _emailIcon;

  String _emailValue;
  get emailValue => _emailValue;

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
  get passwordValue => _passwordValue;
  void passwordChanged(String value) {
    _passwordValue = value;
    notifyListeners();
  }
// #endregion

  String _buttonText = 'Sign up';
  get buttonText => _buttonText;

  void resgister() async {
    final request = RegisterRequest(
      email: _emailValue,
      password: _passwordValue ?? ' ',
      name: _usernameValue,
      phone: _phoneValue,
      gender: _selectedGender,
    );

    updateLoading(true);

    await _registerService.register(request).catchError((e) {
      updateLoading(false);
      if (e is InvalidInputException) {
        final eDecoded = RegisterError1.fromJson(e.toMap());
        String eShowed = '';
        for (Errors e in eDecoded.errors) {
          eShowed += e.msg += '\n';
        }
        dialogService.showDialog(title: e.prefix, description: eShowed);
      } else if (e is BadRequestException) {
        final eDecoded = RegisterError2.fromJson(e.toMap());
        dialogService.showDialog(
            title: e.prefix, description: eDecoded.message);
      } else {
        dialogService.showDialog(
          title: e.prefix,
          description: e.toString(),
        );
      }
    }).then((value) {
      updateLoading(false);
      if (value is RegisterResponse) {
        navigationBundle.updateEmail(emailValue);
        notifyListeners();
        navtoActivate();
      }
    });
  }

// #region Login Text
  String _signIn1 = 'Already have an account?';
  get signIn1 => _signIn1;

  String _signIn2 = ' Sign In';
  get signIn2 => _signIn2;
// #endregion

  void navToLogin() {
    navigationService.back();
  }

  Future navtoActivate() async {
    await navigationService.navigateTo(Routes.activateView);
  }
}
