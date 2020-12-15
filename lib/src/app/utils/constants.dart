import 'package:flutter/material.dart';

class Constants {
  static const pink00 = Color(0x00FF7C9C);
  static const pink = Color(0xFFFF7C9C);
  static const pink18 = Color(0x2EFF7C9C);
  static const pink54 = Color(0x8AFF7C9C);
  static const gradientPink = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [pink00, pink]);

  static const blue = Color(0xFF5285E9);

  static const white = Colors.white;

  static const transparent = Colors.transparent;

  static const black = Colors.black;
  static const black72 = Color(0xB8000000);
  static const black54 = Colors.black54;
  static const black45 = Colors.black45;
  static const black63 = Color(0xA1000000);

  static const BASE_URL = 'http://149.28.24.98:9000';
  static const LOGIN_URL = '$BASE_URL/login';
  static const REGISTER_URL = '$BASE_URL/register';
  static const ACTIVATE_URL = '$BASE_URL/active-account';

  static const SUCCESS = 'Success';
  static const REGISTER_SUCCESS = 'Bạn đã tạo tài khoản thành công';

  static const MALE_AVA_URL = 'assets/images/male.png';
  static const FEMALE_AVA_URL = 'assets/images/female.png';
  static const DEFAULT_NAME = 'Please provide your username';
}
