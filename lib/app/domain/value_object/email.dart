import 'package:vemare/app/domain/value_object/network_error.dart';

class InvalidEmailException implements Exception {}

class Email {
  Email(this.value) {
    if (!isValid(value)) {
      throw ApiException(code: -1, message: 'Email inválido');
    }
  }

  late final String value;
  static final _emailValidator = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static bool isValid(String email) {
    return _emailValidator.hasMatch(email);
  }
}
