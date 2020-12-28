import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'navigation_bundle.dart';

@lazySingleton
class ApiHelper {
  final navigationBundle = locator<NavigationBundle>();
  Future<dynamic> get(String url) async {
    final response = await http.get(url, headers: {
      "Content-type": "application/json",
    }).catchError(
      (e) => throw FetchDataException('No Internet connection'),
      test: (e) => e is SocketException,
    );
    return _returnResponse(response);
  }

  Future<dynamic> post(String url, dynamic request, {String token = ''}) async {
    final response = await http
        .post(url,
            body: jsonEncode(
              request,
            ),
            headers: token == ''
                ? {
                    "Content-type": "application/json",
                    "Accept": "application/json",
                  }
                : {
                    "Content-type": "application/json",
                    "Accept": "application/json",
                    "auth-token": token
                  })
        .catchError(
          (e) => throw FetchDataException('No Internet connection'),
          test: (e) => e is SocketException,
        );
    if (url == Constants.LOGIN_URL && response.statusCode == 200)
      navigationBundle.updateToken(response.headers['auth-token']);
    return _returnResponse(response);
  }

  Future<dynamic> put(String url, dynamic request, {String token = ''}) async {
    if (navigationBundle.token != null) token = navigationBundle.token;
    final response = await http
        .put(url,
            body: jsonEncode(
              request,
            ),
            headers: token == ''
                ? {
                    "Content-type": "application/json",
                    "Accept": "application/json",
                  }
                : {
                    "Content-type": "application/json",
                    "Accept": "application/json",
                    "auth-token": token
                  })
        .catchError(
          (e) => throw FetchDataException('No Internet connection'),
          test: (e) => e is SocketException,
        );
    return _returnResponse(response);
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 401:
        throw UnauthorisedException(response.body);
      case 422:
        throw InvalidInputException(response.body);
      case 500:
        throw BadRequestException(response.body);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
