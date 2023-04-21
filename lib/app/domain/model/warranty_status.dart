class StatusWarranty {
  StatusWarranty({
    this.estadosSustitucion,
    this.estadosTramitacion,
  });

  List<String>? estadosSustitucion;
  List<String>? estadosTramitacion;

  factory StatusWarranty.fromJson(dynamic json) => StatusWarranty(
        estadosSustitucion: json["estados_sustitucion"] == null
            ? []
            : List<String>.from(json["estados_sustitucion"]!.map((x) => x)),
        estadosTramitacion: json["estados_tramitacion"] == null
            ? []
            : List<String>.from(json["estados_tramitacion"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "estados_sustitucion": estadosSustitucion == null
            ? []
            : List<dynamic>.from(estadosSustitucion!.map((x) => x)),
        "estados_tramitacion": estadosTramitacion == null
            ? []
            : List<dynamic>.from(estadosTramitacion!.map((x) => x)),
      };
}
