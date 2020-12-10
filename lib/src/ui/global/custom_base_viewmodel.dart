import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/services/navigation_bundle.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final navigationBundle = locator<NavigationBundle>();
  final snackbarService = locator<SnackbarService>();

  bool _isLoading = false;
  get isLoading => _isLoading;
  void updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
