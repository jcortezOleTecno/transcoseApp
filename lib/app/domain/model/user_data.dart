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
  final String? postal_code;
  final String? responsible_name;
  final String? responsible_lastname;
  final int? role_id;
  final int? parent_id;
  final String? status;
  final int? access_millennium_program;

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
    this.postal_code,
    this.responsible_name,
    this.responsible_lastname,
    this.role_id,
    this.parent_id,
    this.status,
    this.access_millennium_program,
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
      postal_code: map["postal_code"] as String?,
      responsible_name: map["responsible_name"] as String?,
      responsible_lastname: map["responsible_lastname"] as String?,
      role_id: map["role_id"] as int?,
      parent_id: map["parent_id"] as int?,
      status: map["status"] as String?,
      access_millennium_program: map["access_millennium_program"] as int?,
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
      'postal_code': postal_code,
      'responsible_name': responsible_name,
      'responsible_lastname': responsible_lastname,
      'role_id': role_id,
      'parent_id': parent_id,
      'status': status,
      'access_millennium_program': access_millennium_program,
    };
  }
}
