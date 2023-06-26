class HeaderEvents {
  String? title;
  String? description;

  HeaderEvents({
    this.title,
    this.description,
  });

  factory HeaderEvents.fromJson(dynamic json) => HeaderEvents(
        title: json["title"] as String?,
        description: json["description"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
