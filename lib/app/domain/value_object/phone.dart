class InvalidPhoneException implements Exception {}

class Phone {
  Phone(this.value) {
    if (!isValid(value)) {
      throw InvalidPhoneException();
    }
  }

  late final String value;

  static bool isValid(String phone) {
    return phone.isNotEmpty && phone.length >= 9;
  }
}
