class InvalidPasswordException implements Exception {}

class Password {
  Password(this.value) {
    if (!isValid(value)) {
      throw InvalidPasswordException();
    }
  }

  late final String value;

  static bool isValid(String pass) {
    return pass.isNotEmpty && pass.length > 5;
  }
}
