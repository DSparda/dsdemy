import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/feature/category_response.dart';
import 'package:udemy1/src/app/models/feature/course_response.dart';
import 'package:udemy1/src/services/feature_api.dart';

const String _CategoriesDelayFuture = 'delayedCategories';
const String _TopCoursesDelayFuture = 'delayedTopCourses';
const String _FreeCoursesDelayFuture = 'delayedFreeCourses';

@singleton
class FeatureViewModel extends MultipleFutureViewModel {
  final _featureService = locator<FeatureSerivce>();

  List<CategoryResponse> get fetchedCategories =>
      dataMap[_CategoriesDelayFuture];
  List<CourseResponse> get fetchedTopCourses => dataMap[_TopCoursesDelayFuture];
  List<CourseResponse> get fetchedFreeCourses =>
      dataMap[_FreeCoursesDelayFuture];

  bool get fetchingCategories => busy(_CategoriesDelayFuture);
  bool get fetchingTopCourses => busy(_TopCoursesDelayFuture);
  bool get fetchingFreeCourses => busy(_FreeCoursesDelayFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
        _CategoriesDelayFuture: getAllCategories,
        _TopCoursesDelayFuture: getAllTopCourses,
        _FreeCoursesDelayFuture: getAllFreeCourses,
      };

  Future<List<CategoryResponse>> getAllCategories() async {
    final response = await _featureService.getAllCategories();
    return response;
  }

  Future<List<CourseResponse>> getAllTopCourses() async {
    final response = await _featureService.getAllTopCourses();
    return response;
  }

  Future<List<CourseResponse>> getAllFreeCourses() async {
    final response = await _featureService.getAllFreeCourses();
    return response;
  }
}
