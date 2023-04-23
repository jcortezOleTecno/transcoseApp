class RedesSociales {
  RedesSociales({
    this.facebook,
    this.instagram,
    this.youtube,
    this.linkedin,
  });

  String? facebook;
  String? instagram;
  String? youtube;
  String? linkedin;

  factory RedesSociales.fromJson(dynamic json) => RedesSociales(
        facebook: json["facebook"] as String?,
        instagram: json["instagram"] as String?,
        youtube: json["youtube"] as String?,
        linkedin: json["linkedin"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "instagram": instagram,
        "youtube": youtube,
        "linkedin": linkedin,
      };
}
