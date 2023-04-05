class InvalidDateException implements Exception {}

class VmrDate {
  VmrDate(this.value) {
    if (!isValid(value)) {
      throw InvalidDateException();
    }
  }

  late final String value;

  static bool isValid(String date) {
    final parsedDate = DateTime.tryParse(date);
    return parsedDate != null;
  }
}
