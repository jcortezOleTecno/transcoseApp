class Gallery {
  Gallery({
    required this.id,
    required this.name,
    required this.path,
    required this.imagen,
  });

  int id;
  String name;
  String path;
  String imagen;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    path: json["path"] ?? '',
    imagen: json["imagen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "path": path,
    "imagen": imagen,
  };
}
