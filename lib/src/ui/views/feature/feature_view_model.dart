import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/feature/category_response.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/services/feature_api.dart';

const String _CategoriesDelayFuture = 'delayedCategories';

@singleton
class FeatureViewModel extends MultipleFutureViewModel {
  final _featureService = locator<FeatureSerivce>();

  List<CategoryResponse> get fetchedCategories =>
      dataMap[_CategoriesDelayFuture];

  bool get fetchingCategories => busy(_CategoriesDelayFuture);

  @override
  Map<String, Future Function()> get futuresMap =>
      {_CategoriesDelayFuture: getAllCategory};

  Future<List<CategoryResponse>> getAllCategory() async {
    final response = await _featureService.getAllCategory();

    return response;
  }

  String idToImageUrl(String id) {
    if (id == '5f66f8bc877b74b5e133db8c')
      return Constants.MATH_INFO_CATEGORY_IMAGE_URL;
    else if (id == '5f66f8e0877b74b5e133db8d')
      return Constants.INFO_TECT_CATEGORY_IMAGE_URL;
    else if (id == '5fa4ac6fb4e3807bf40fed22')
      return Constants.ENGLISH_CATEGORY_IMAGE_URL;
    return '';
  }
}
