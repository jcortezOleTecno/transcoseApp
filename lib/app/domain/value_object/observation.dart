class InvalidObservationException implements Exception {}

class Observation {
  Observation(this.value) {
    if (!isValid(value)) {
      throw InvalidObservationException();
    }
  }

  late final String value;

  static bool isValid(String name) {
    return name.isNotEmpty;
  }
}
