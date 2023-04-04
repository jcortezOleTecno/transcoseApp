class Pills {
  Pills({
    required this.id,
    this.title,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.file,
    this.pdf,
    this.vimeoLink,
    this.videoPreview,
    this.visits,
    this.image,
  });

  int id;
  String? title;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  String? file;
  String? pdf;
  String? vimeoLink;
  String? videoPreview;
  int? visits;
  String? image;

  factory Pills.fromJson(dynamic json) => Pills(
        id: json["id"] as int,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        subtitle: json["subtitle"] as String?,
        description: json["description"] as String?,
        file: json["file"] as String?,
        pdf: json["pdf"] as String?,
        vimeoLink: json["vimeo_link"] as String?,
        videoPreview: json["video_preview"] as String?,
        visits: json["visits"] as int?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "description": description,
        "file": file,
        "pdf": pdf,
        "vimeo_link": vimeoLink,
        "video_preview": videoPreview,
        "visits": visits,
        "image": image,
      };
}
