import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';

@lazySingleton
class ApiHelper {
  Future<dynamic> post(String url, dynamic request) async {
    final response = await http.post(url,
        body: jsonEncode(
          request,
        ),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        }).catchError(
      (e) => throw FetchDataException('No Internet connection'),
      test: (e) => e is SocketException,
    );
    return _returnResponse(response);
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        print(responseJson);
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
