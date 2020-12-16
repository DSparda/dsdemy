import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/models/feature/category_response.dart';
import 'package:udemy1/src/services/feature_api.dart';

@singleton
class FeatureViewModel extends FutureViewModel<List<CategoryResponse>> {
  final _featureService = locator<FeatureSerivce>();
  final _dialogService = locator<DialogService>();

  Future<List<CategoryResponse>> getDataFromServer() async {
    final response = await _featureService.getAllCategory();
    return response;
  }

  @override
  Future<List<CategoryResponse>> futureToRun() => getDataFromServer();

  @override
  void onError(error) {
    _dialogService.showDialog(
      description: error.toString(),
    );
  }
}
