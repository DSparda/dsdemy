import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/register/register_request.dart';
import 'package:udemy1/src/app/models/register/register_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/api_helper.dart';

@lazySingleton
class RegisterService {
  final _apiHelper = locator<ApiHelper>();

  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final response =
        await _apiHelper.post(Constants.REGISTER_URL, registerRequest);
    return RegisterResponse.fromJson(response);
  }
}
