import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/user/update_profile_request.dart';
import 'package:udemy1/src/app/models/user/update_profile_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';

import 'api_helper.dart';

@lazySingleton
class UserService {
  final _apiHelper = locator<ApiHelper>();

  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest request) async {
    final response =
        await _apiHelper.put(Constants.UPDATE_PROFILE_URL, request);
    return UpdateProfileResponse.fromJson(response);
  }
}
