// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) => new List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => new Photos(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}