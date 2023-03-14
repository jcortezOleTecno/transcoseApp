class UserRol {
  final String name;
  final int id;
  final String code;

  UserRol({
    required this.name,
    required this.id,
    required this.code,
  });

  factory UserRol.fromJson(dynamic map) {
    return UserRol(
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
