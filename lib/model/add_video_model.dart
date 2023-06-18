// To parse this JSON data, do
//
//     final addVideo = addVideoFromJson(jsonString);

import 'dart:convert';

AddVideo addVideoFromJson(String str) => AddVideo.fromJson(json.decode(str));

String addVideoToJson(AddVideo data) => json.encode(data.toJson());

class AddVideo {
    AddVideo({
        required this.uid,
        required this.url,
        required this.address,
        required this.lat,
        required this.long,
        required this.category,
        required this.genre,
        required this.title,
        required this.description,
        required this.pros,
        required this.cons,
        required this.rating,
        required this.shared,
        required this.draft,
        required this.views,
        required this.likes,
    });

    int uid;
    List<String> url;
    String address;
    int lat;
    int long;
    String category;
    String genre;
    String title;
    String description;
    String pros;
    String cons;
    int rating;
    bool shared;
    bool draft;
    int views;
    int likes;

    factory AddVideo.fromJson(Map<String, dynamic> json) => AddVideo(
        uid: json["uid"],
        url: List<String>.from(json["url"].map((x) => x)),
        address: json["address"],
        lat: json["lat"],
        long: json["long"],
        category: json["category"],
        genre: json["genre"],
        title: json["title"],
        description: json["description"],
        pros: json["pros"],
        cons: json["cons"],
        rating: json["rating"],
        shared: json["shared"],
        draft: json["draft"],
        views: json["views"],
        likes: json["likes"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "url": List<dynamic>.from(url.map((x) => x)),
        "address": address,
        "lat": lat,
        "long": long,
        "category": category,
        "genre": genre,
        "title": title,
        "description": description,
        "pros": pros,
        "cons": cons,
        "rating": rating,
        "shared": shared,
        "draft": draft,
        "views": views,
        "likes": likes,
    };
}
