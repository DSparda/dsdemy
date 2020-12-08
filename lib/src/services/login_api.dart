import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/login/login_request.dart';
import 'package:udemy1/src/app/models/login/login_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'api_helper.dart';

@lazySingleton
class LoginService {
  final _apiHelper = locator<ApiHelper>();

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await _apiHelper.post(Constants.LOGIN_URL, loginRequest);
    return LoginResponse.fromJson(response);
  }
}
