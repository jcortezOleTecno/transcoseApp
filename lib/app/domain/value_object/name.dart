class InvalidNameException implements Exception {}

class Name {
  Name(this.value) {
    if (!isValid(value)) {
      throw InvalidNameException();
    }
  }

  late final String value;

  static bool isValid(String name) {
    return name.isNotEmpty;
  }
}
