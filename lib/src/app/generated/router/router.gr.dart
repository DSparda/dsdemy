// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/views/activate/activate_view.dart';
import '../../../ui/views/activate_success/activate_success_view.dart';
import '../../../ui/views/feature/feature_view.dart';
import '../../../ui/views/login/login_view.dart';
import '../../../ui/views/register/register_view.dart';
import '../../../ui/views/user/update_user_view.dart';
import '../../../ui/views/user/user_view.dart';
import '../../../ui/widgets/smart/bottom_bar_view.dart';

class Routes {
  static const String loginView = '/';
  static const String registerView = '/register-view';
  static const String userView = '/user-view';
  static const String activateView = '/activate-view';
  static const String activateSuccessView = '/activate-success-view';
  static const String featureView = '/feature-view';
  static const String bottomBarView = '/bottom-bar-view';
  static const String updateUserView = '/update-user-view';
  static const all = <String>{
    loginView,
    registerView,
    userView,
    activateView,
    activateSuccessView,
    featureView,
    bottomBarView,
    updateUserView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.userView, page: UserView),
    RouteDef(Routes.activateView, page: ActivateView),
    RouteDef(Routes.activateSuccessView, page: ActivateSuccessView),
    RouteDef(Routes.featureView, page: FeatureView),
    RouteDef(Routes.bottomBarView, page: BottomBarView),
    RouteDef(Routes.updateUserView, page: UpdateUserView),
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
    UserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserView(),
        settings: data,
      );
    },
    ActivateView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ActivateView(),
        settings: data,
      );
    },
    ActivateSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ActivateSuccessView(),
        settings: data,
      );
    },
    FeatureView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeatureView(),
        settings: data,
      );
    },
    BottomBarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BottomBarView(),
        settings: data,
      );
    },
    UpdateUserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UpdateUserView(),
        settings: data,
      );
    },
  };
}
