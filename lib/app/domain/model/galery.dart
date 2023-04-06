class Gallery {
  Gallery({
    required this.imagen,
  });

  String imagen;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
      };
}
