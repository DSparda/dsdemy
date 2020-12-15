import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/generated/router/router.gr.dart';
import 'package:udemy1/src/app/models/activate/activate_request.dart';
import 'package:udemy1/src/app/models/activate/activate_response.dart';
import 'package:udemy1/src/app/models/register/register_error2.dart';
import 'package:udemy1/src/app/utils/api_exceptions.dart';
import 'package:udemy1/src/services/activate_api.dart';
import 'package:udemy1/src/ui/global/custom_base_viewmodel.dart';

class ActivateViewModel extends CustomBaseViewModel {
  final _activateService = locator<ActivateService>();
  String get email => navigationBundle.email;

  // #region Sign In Text
  String _title1 = 'ACTIVATION';
  get title1 => _title1;

  String _title2 = 'CODE';
  get title2 => _title2;
// #endregion

  String _description =
      'Please enter the activation code sent to your registered email inbox';
  get description => _description;

  String _code = 'Enter your activation code';
  get code => _code;

  String _codeValue;
  get passwordValue => _codeValue;
  void codeChanged(String value) {
    _codeValue = value;
    notifyListeners();
  }

  String _buttonText = 'Continue';
  get buttonText => _buttonText;

  void activate() async {
    final request = ActivateRequest(
      email: email,
      activeToken: _codeValue,
    );

    updateLoading(true);

    await _activateService.activate(request).catchError((e) {
      updateLoading(false);
      if (e is BadRequestException) {
        final eDecoded = RegisterError2.fromJson(e.toMap());
        dialogService.showDialog(
            title: e.prefix, description: eDecoded.message);
      } else {
        dialogService.showDialog(
          title: e.prefix,
          description: e.toString(),
        );
      }
    }).then((value) {
      updateLoading(false);
      if (value is ActivateResponse) {
        navToActivateSuccess();
      }
    });
  }

  Future navToActivateSuccess() async {
    await navigationService.navigateTo(Routes.activateSuccessView);
  }
}
