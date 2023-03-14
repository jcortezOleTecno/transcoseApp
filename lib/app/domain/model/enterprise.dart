class Enterprise {
  final int id;
  final String name;
  final String code;

  Enterprise({
    required this.name,
    required this.id,
    required this.code,
  });

  factory Enterprise.fromJson(dynamic map) {
    return Enterprise(
      name: map["name"] as String,
      id: map["id"] as int,
      code: map["code"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'code': code,
    };
  }
}
