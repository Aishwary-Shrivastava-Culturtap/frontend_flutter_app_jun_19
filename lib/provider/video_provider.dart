import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class video_provider with ChangeNotifier {
  List<File> _list = [];

  get getItems => [..._list];

  void add(File item) {
    _list.add(item);
    notifyListeners();
  }


  delete(index) {
    _list.removeAt(index);
    notifyListeners();

  }
}

////////////////////////////////////////////////////////////////////////

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

 
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
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
    });

    int uid;
    String url;
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

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        uid: json["uid"],
        url: json["url"],
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
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "url": url,
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
    };
}
