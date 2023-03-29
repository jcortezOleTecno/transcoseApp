class Person {
  String? firstName;
  String? lastName;
  String? phone;

  Person({this.firstName, this.lastName, this.phone});

  Person copyWith({String? firstName, String? lastName, String? phone}) {
    return Person(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }
}
