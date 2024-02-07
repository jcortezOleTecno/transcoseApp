class RedesSociales {
  RedesSociales({
    this.facebook = 'https://www.facebook.com/transcose',
    this.instagram = 'https://www.instagram.com/adtranscose',
    this.youtube = 'https://www.linkedin.com/company/especialistas-diesel-iberia-edi',
    this.linkedin = 'https://www.youtube.com/channel/UCO9t81VyZqRfY4oSIGkD9aQ',
  });

  String facebook;
  String instagram;
  String youtube;
  String linkedin;

  factory RedesSociales.fromJson(dynamic json) => RedesSociales(
        facebook: json["facebook"] as String,
        instagram: json["instagram"] as String,
        youtube: json["youtube"] as String,
        linkedin: json["linkedin"] as String,
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "instagram": instagram,
        "youtube": youtube,
        "linkedin": linkedin,
      };
}
