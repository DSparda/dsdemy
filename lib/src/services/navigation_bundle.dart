import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class NavigationBundle with ReactiveServiceMixin {
  // ignore: unused_field
  RxValue<String> _email = RxValue<String>(initial: '');
  get email => _email.value;

  RxValue<String> _name = RxValue<String>(initial: '');
  get name => _name.value;

  NavigationBundle() {
    //3
    listenToReactiveValues([_name, _email]);
  }

  RxValue<String> _gender = RxValue<String>(initial: '');
  get gender => _gender.value;

  RxValue<String> _phone = RxValue<String>(initial: '');
  get phone => _phone.value;

  RxValue<String> _description = RxValue<String>(initial: '');
  get description => _description.value;

  RxValue<String> _address = RxValue<String>(initial: '');
  get address => _address.value;

  String _token;
  get token => _token;

  void updateEmail(String value) {
    _email.value = value;
  }

  void updateName(String value) {
    _name.value = value;
  }

  void updateGender(String value) {
    _gender.value = value;
  }

  void updatePhone(String value) {
    _phone.value = value;
  }

  void updateDescription(String value) {
    _description.value = value;
  }

  void updateAddress(String value) {
    _address.value = value;
  }

  void updateToken(String value) {
    _token = value;
  }
}
