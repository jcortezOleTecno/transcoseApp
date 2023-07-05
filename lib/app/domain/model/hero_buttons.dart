class HeroButtons {
  String? whatsapp;
  String? email;

  HeroButtons({
    this.whatsapp,
    this.email,
  });

  factory HeroButtons.fromJson(dynamic json) => HeroButtons(
        whatsapp: json["whatsapp"] as String?,
        email: json["email"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "whatsapp": whatsapp,
        "email": email,
      };
}
