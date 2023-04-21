class Modelo347 {
  Modelo347({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory Modelo347.fromJson(dynamic json) => Modelo347(
        name: json["name"] as String?,
        value: json["value"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
