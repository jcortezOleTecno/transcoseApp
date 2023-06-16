class WeHelpYou {
  WeHelpYouData? sat;
  WeHelpYouData? remoteConnection;

  WeHelpYou({
    this.sat,
    this.remoteConnection,
  });

  factory WeHelpYou.fromJson(Map<String, dynamic> json) => WeHelpYou(
        sat: json["sat"] == null ? null : WeHelpYouData.fromJson(json["sat"]),
        remoteConnection: json["remote_connection"] == null
            ? null
            : WeHelpYouData.fromJson(json["remote_connection"]),
      );

  Map<String, dynamic> toJson() => {
        "sat": sat?.toJson(),
        "remote_connection": remoteConnection?.toJson(),
      };
}

class WeHelpYouData {
  int? id;
  String? title;
  String? tags;
  String? description;
  String? externalLink;
  String? type;
  String? image;
  int? active;

  WeHelpYouData({
    this.id,
    this.title,
    this.tags,
    this.description,
    this.externalLink,
    this.type,
    this.image,
    this.active,
  });

  factory WeHelpYouData.fromJson(Map<String, dynamic> json) => WeHelpYouData(
        id: json["id"],
        title: json["title"],
        tags: json["tags"],
        description: json["description"],
        externalLink: json["external_link"],
        type: json["type"],
        image: json["image"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "tags": tags,
        "description": description,
        "external_link": externalLink,
        "type": type,
        "image": image,
        "active": active,
      };
}
