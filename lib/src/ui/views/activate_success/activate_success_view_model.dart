import 'package:udemy1/src/app/generated/router/router.gr.dart';
import 'package:udemy1/src/ui/global/custom_base_viewmodel.dart';

class ActivateSuccessViewModel extends CustomBaseViewModel {
    // #region Sign In Text
  String _title1 = 'SUCCESS';
  get title1 => _title1;

  String _title2 = 'ACTIVATION';
  get title2 => _title2;
// #endregion

  String _description = 'Your account has been create successfully';
  get description => _description;

  String _buttonText = 'Sign in';
  get buttonText => _buttonText;

  Future navToLogin() async {
    await navigationService.clearStackAndShow(Routes.loginView);
  }
}
