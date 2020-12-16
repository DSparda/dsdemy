import 'dart:convert';

class AppException implements Exception {
  final _message;
  final _prefix;
  get prefix => _prefix;

  AppException([this._message, this._prefix]);

  Map<String, dynamic> toMap() {
    return jsonDecode(_message);
  }

  String toString() {
    return '$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input ");
}
