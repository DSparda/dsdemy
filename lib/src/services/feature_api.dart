import 'package:injectable/injectable.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/feature/category_response.dart';
import 'package:udemy1/src/app/models/feature/course_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/api_helper.dart';

@lazySingleton
class FeatureSerivce {
  final _apiHelper = locator<ApiHelper>();

  Future<List<CategoryResponse>> getAllCategories() async {
    final response = await _apiHelper.get(Constants.GET_ALL_CATEGORY_URL);
    return (response as List).map((e) => CategoryResponse.fromJson(e)).toList();
  }

  Future<List<CourseResponse>> getAllTopCourses() async {
    final response = await _apiHelper.get(Constants.GET_ALL_TOP_COURSE_URL);
    return (response as List).map((e) => CourseResponse.fromJson(e)).toList();
  }

  Future<List<CourseResponse>> getAllFreeCourses() async {
    final response = await _apiHelper.get(Constants.GET_ALL_FREE_COURSE_URL);
    return (response as List).map((e) => CourseResponse.fromJson(e)).toList();
  }
}
