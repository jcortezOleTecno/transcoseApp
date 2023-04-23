import 'package:vemare/app/domain/model/galery.dart';

class Services {
  final int? id;
  final String? title;
  final String? slug;
  final String? tags;
  final String? type;
  final String? subtitle;
  final String? description;
  final String? contentPage;
  final String? externalLink;
  final String? buttonText;
  final String? youtubeVideo;
  final String? image;
  final List<Gallery>? gallery;

  Services({
    this.id,
    this.title,
    this.slug,
    this.tags,
    this.type,
    this.subtitle,
    this.description,
    this.contentPage,
    this.externalLink,
    this.buttonText,
    this.youtubeVideo,
    this.image,
    this.gallery,
  });
  factory Services.froJson(dynamic map) {
    return Services(
      id: map['id'] as int?,
      title: map['title'] as String?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      type: map['type'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      contentPage: map['content_page'] as String?,
      externalLink: map['external_link'] as String?,
      buttonText: map['button_text'] as String?,
      youtubeVideo: map['youtube_video'] as String?,
      image: map['image'] as String?,
      gallery:
          List<Gallery>.from(map["gallery"].map((x) => Gallery.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
      'tags': tags,
      'type': type,
      'subtitle': subtitle,
      'description': description,
      'content_page': contentPage,
      'external_link': externalLink,
      'button_text': buttonText,
      'youtube_video': youtubeVideo,
      'image': image,
      "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
    };
  }
}
