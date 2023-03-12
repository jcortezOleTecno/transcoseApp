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
  final int? accessMillenniumProgram;

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
    this.accessMillenniumProgram,
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
      accessMillenniumProgram: map["access_millennium_program"] as int?,
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
      'access_millennium_program': accessMillenniumProgram,
    };
  }
}
