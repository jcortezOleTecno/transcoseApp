class Employee {
  Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? phone;

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
  }) =>
      Employee(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
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
}
