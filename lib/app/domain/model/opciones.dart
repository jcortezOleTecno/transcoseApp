class Opciones {
  Opciones({
    this.zones,
    this.jobs,
  });

  List<String>? zones;
  List<String>? jobs;

  factory Opciones.fromJson(Map<String, dynamic> json) => Opciones(
        zones: json["zones"] == null
            ? []
            : List<String>.from(json["zones"]!.map((x) => x)),
        jobs: json["jobs"] == null
            ? []
            : List<String>.from(json["jobs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "zones": zones == null ? [] : List<dynamic>.from(zones!.map((x) => x)),
        "jobs": jobs == null ? [] : List<dynamic>.from(jobs!.map((x) => x)),
      };
}
