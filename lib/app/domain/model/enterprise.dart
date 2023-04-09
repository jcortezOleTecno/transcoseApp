class Enterprise {
  final int id;
  final String name;
  final String phone;
  final String code;

  Enterprise({
    required this.id,
    required this.name,
    required this.phone,
    required this.code,
  });

  factory Enterprise.fromJson(dynamic map) {
    return Enterprise(
      id: map["id"] as int,
      name: map["name"] as String,
      phone: map["phone"] as String,
      code: map["code"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'code': code,
    };
  }
}
