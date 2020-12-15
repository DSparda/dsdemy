import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationBundle {
  // ignore: unused_field
  String _email;
  get email => _email;

  String _name;
  get name => _name;

  String _gender;
  get gender => _gender;

  String _token;
  get toket => _token;

  void updateEmail(String value) {
    _email = value;
  }

    void updateName(String value) {
    _name = value;
  }

  void updateGender(String value) {
    _gender = value;
  }  
}
