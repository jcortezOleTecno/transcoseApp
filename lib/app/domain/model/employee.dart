class Employee {
  Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
  }) =>
      Employee(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  factory Employee.fromJson(dynamic json) => Employee(
        id: json["id"] as int?,
        firstName: json["name"] as String?,
        lastName: json["lastname"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": firstName,
        "lastname": lastName,
      };

  Map<String, dynamic> toEnrollData() => {
        "name": firstName,
        "lastname": lastName,
        "phone": phone,
        "email": email,
      };
}
