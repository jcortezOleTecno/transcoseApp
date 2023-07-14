class Role {
  int? id;
  String? name;
  String? code;

  Role({
    this.id,
    this.name,
    this.code,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
