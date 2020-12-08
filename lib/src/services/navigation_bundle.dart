import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationBundle {
  // ignore: unused_field
  String _email;
  get email => _email;

  void updateEmail(String value) {
    _email = value;
  }
}
