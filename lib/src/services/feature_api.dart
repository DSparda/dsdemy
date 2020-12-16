import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/feature/category_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/api_helper.dart';

@lazySingleton
class FeatureSerivce {
  final _apiHelper = locator<ApiHelper>();

  Future<List<CategoryResponse>> getAllCategory() async {
    final response = await _apiHelper.get(Constants.GET_ALL_CATEGORY_URL);
    return (response as List).map((e) => CategoryResponse.fromJson(e)).toList();
  }
}
