class UserData {
  final String? name;
  final String? email;
  final String? lastname;
  final String? code;
  final String? cif;
  final String? phone;
  final String? address;
  final String? city;
  final String? province;
  final String? postalCode;
  final String? responsibleName;
  final String? responsibleLastname;
  final int? roleId;
  final int? parentId;
  final String? status;
  String? logo;
  final int? accessMillenniumProgram;
  Webservice? webservice;

  UserData({
    this.name,
    this.email,
    this.lastname,
    this.code,
    this.cif,
    this.phone,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.responsibleName,
    this.responsibleLastname,
    this.roleId,
    this.parentId,
    this.status,
    this.logo,
    this.accessMillenniumProgram,
    this.webservice,
  });

  factory UserData.froJson(dynamic map) {
    return UserData(
      name: map["name"] as String?,
      email: map["email"] as String?,
      lastname: map["lastname"] as String?,
      code: map["code"] as String?,
      cif: map["cif"] as String?,
      phone: map["phone"] as String?,
      address: map["address"] as String?,
      city: map["city"] as String?,
      province: map["province"] as String?,
      postalCode: map["postal_code"] as String?,
      responsibleName: map["responsible_name"] as String?,
      responsibleLastname: map["responsible_lastname"] as String?,
      roleId: map["role_id"] as int?,
      parentId: map["parent_id"] as int?,
      status: map["status"] as String?,
      logo: map["logo"] as String?,
      accessMillenniumProgram: map["access_millennium_program"] as int?,
      webservice: map["webservice"] == null
          ? null
          : Webservice.fromJson(map["webservice"]),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'lastname': lastname,
      'code': code,
      'cif': cif,
      'phone': phone,
      'address': address,
      'city': city,
      'province': province,
      'postal_code': postalCode,
      'responsible_name': responsibleName,
      'responsible_lastname': responsibleLastname,
      'role_id': roleId,
      'parent_id': parentId,
      'status': status,
      'logo': logo,
      'access_millennium_program': accessMillenniumProgram,
      "webservice": webservice?.toJson(),
    };
  }
}

class Webservice {
  Webservice({
    this.codigo,
    this.nombre,
    this.cif,
    this.direccion,
    this.cp,
    this.poblacion,
    this.telefono1,
    this.telefono2,
    this.comerciales,
    this.centroReparto,
    this.otrosCodigos,
    this.permiteComprasCredito,
    this.latitud,
    this.longitud,
    this.millennium,
    this.convencion,
  });

  int? codigo;
  String? nombre;
  String? cif;
  String? direccion;
  String? cp;
  String? poblacion;
  String? telefono1;
  String? telefono2;
  List<Comerciale>? comerciales;
  List<CentroReparto>? centroReparto;
  List<OtrosCodigo>? otrosCodigos;
  bool? permiteComprasCredito;
  double? latitud;
  double? longitud;
  bool? millennium;
  bool? convencion;

  factory Webservice.fromJson(Map<String, dynamic> json) => Webservice(
        codigo: json["codigo"],
        nombre: json["nombre"],
        cif: json["cif"],
        direccion: json["direccion"],
        cp: json["cp"],
        poblacion: json["poblacion"],
        telefono1: json["telefono1"],
        telefono2: json["telefono2"],
        comerciales: json["comerciales"] == null
            ? []
            : List<Comerciale>.from(
                json["comerciales"]!.map((x) => Comerciale.fromJson(x))),
        centroReparto: json["centro_reparto"] == null
            ? []
            : List<CentroReparto>.from(
                json["centro_reparto"]!.map((x) => CentroReparto.fromJson(x))),
        otrosCodigos: json["otros_codigos"] == null
            ? []
            : List<OtrosCodigo>.from(
                json["otros_codigos"]!.map((x) => OtrosCodigo.fromJson(x))),
        permiteComprasCredito: json["permite_compras_credito"],
        latitud: json["latitud"]?.toDouble(),
        longitud: json["longitud"]?.toDouble(),
        millennium: json["millennium"],
        convencion: json["convencion"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "cif": cif,
        "direccion": direccion,
        "cp": cp,
        "poblacion": poblacion,
        "telefono1": telefono1,
        "telefono2": telefono2,
        "comerciales": comerciales == null
            ? []
            : List<dynamic>.from(comerciales!.map((x) => x.toJson())),
        "centro_reparto": centroReparto == null
            ? []
            : List<dynamic>.from(centroReparto!.map((x) => x.toJson())),
        "otros_codigos": otrosCodigos == null
            ? []
            : List<dynamic>.from(otrosCodigos!.map((x) => x.toJson())),
        "permite_compras_credito": permiteComprasCredito,
        "latitud": latitud,
        "longitud": longitud,
        "millennium": millennium,
        "convencion": convencion,
      };
}

class CentroReparto {
  CentroReparto({
    this.nombre,
    this.direccion,
    this.cp,
    this.poblacion,
    this.telefonos,
    this.movil,
    this.email,
    this.horario,
  });

  String? nombre;
  String? direccion;
  String? cp;
  String? poblacion;
  String? telefonos;
  String? movil;
  String? email;
  String? horario;

  factory CentroReparto.fromJson(Map<String, dynamic> json) => CentroReparto(
        nombre: json["nombre"],
        direccion: json["direccion"],
        cp: json["cp"],
        poblacion: json["poblacion"],
        telefonos: json["telefonos"],
        movil: json["movil"],
        email: json["email"],
        horario: json["horario"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
        "cp": cp,
        "poblacion": poblacion,
        "telefonos": telefonos,
        "movil": movil,
        "email": email,
        "horario": horario,
      };
}

class Comerciale {
  Comerciale({
    this.nombre,
    this.eMail,
    this.telefono,
    this.telefonoMovil,
    this.tipoComercial,
  });

  String? nombre;
  String? eMail;
  String? telefono;
  String? telefonoMovil;
  String? tipoComercial;

  factory Comerciale.fromJson(Map<String, dynamic> json) => Comerciale(
        nombre: json["nombre"],
        eMail: json["e_mail"],
        telefono: json["telefono"],
        telefonoMovil: json["telefono_movil"],
        tipoComercial: json["tipo_comercial"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "e_mail": eMail,
        "telefono": telefono,
        "telefono_movil": telefonoMovil,
        "tipo_comercial": tipoComercial,
      };
}

class OtrosCodigo {
  OtrosCodigo({
    this.codigo,
    this.nombre,
  });

  int? codigo;
  String? nombre;

  factory OtrosCodigo.fromJson(Map<String, dynamic> json) => OtrosCodigo(
        codigo: json["codigo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
      };
}
