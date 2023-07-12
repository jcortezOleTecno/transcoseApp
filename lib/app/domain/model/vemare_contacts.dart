class VemareContacts {
  List<CentroReparto>? comerciales;
  CentroReparto? centroReparto;

  VemareContacts({
    this.comerciales,
    this.centroReparto,
  });

  factory VemareContacts.fromJson(dynamic json) => VemareContacts(
        comerciales: json["comerciales"] == null
            ? []
            : List<CentroReparto>.from(
                json["comerciales"]!.map((x) => CentroReparto.fromJson(x))),
        centroReparto: json["centro_reparto"] == null
            ? null
            : CentroReparto.fromJson(json["centro_reparto"]),
      );

  Map<String, dynamic> toJson() => {
        "comerciales": comerciales == null
            ? []
            : List<dynamic>.from(comerciales!.map((x) => x.toJson())),
        "centro_reparto": centroReparto?.toJson(),
      };
}

class CentroReparto {
  String? name;
  String? phone;

  CentroReparto({
    this.name,
    this.phone,
  });

  factory CentroReparto.fromJson(Map<String, dynamic> json) => CentroReparto(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}
