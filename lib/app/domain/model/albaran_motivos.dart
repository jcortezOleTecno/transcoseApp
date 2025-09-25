
class AlbaranMotivos {
  int code;
  String name;

  AlbaranMotivos({
    required this.code,
    required this.name,
  });

  factory AlbaranMotivos.fromJson(dynamic json) => AlbaranMotivos(
    code: json["codigo_motivo"] ?? 0,
    name: json["nombre"] ?? '',
  );
}
