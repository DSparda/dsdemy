// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/views/login/login_view.dart';
import '../../../ui/views/register/register_view.dart';
import '../../../ui/views/user_home/user_home_view.dart';

class Routes {
  static const String loginView = '/';
  static const String registerView = '/register-view';
  static const String userHomeView = '/user-home-view';
  static const all = <String>{
    loginView,
    registerView,
    userHomeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.userHomeView, page: UserHomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    UserHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserHomeView(),
        settings: data,
      );
    },
  };
}
