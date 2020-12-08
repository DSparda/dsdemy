import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/activate/activate_request.dart';
import 'package:udemy1/src/app/models/activate/activate_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'api_helper.dart';

@lazySingleton
class ActivateService {
  final _apiHelper = locator<ApiHelper>();

  Future<ActivateResponse> activate(ActivateRequest request) async {
    final response = await _apiHelper.post(Constants.ACTIVATE_URL, request);
    return ActivateResponse.fromJson(response);
  }
}
