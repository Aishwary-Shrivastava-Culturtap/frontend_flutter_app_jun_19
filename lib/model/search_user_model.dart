





// To parse this JSON data, do
//
//     final list_user_model = list_user_modelFromJson(jsonString);

import 'dart:convert';

List<list_user_model> list_user_modelFromJson(String str) => List<list_user_model>.from(json.decode(str).map((x) => list_user_model.fromJson(x)));

String list_user_modelToJson(List<list_user_model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class list_user_model {
    list_user_model({
        required this.uid,
        required this.name,
        required this.countryCode,
        required this.phoneNo,
        required this.profilePic,
        required this.coverPic,
        required this.gender,
        required this.languageSpeak,
        required this.address,
        required this.quote,
        required this.followers,
        required this.followings,
        required this.profession,
        required this.dob,
        required this.btp,
        required this.bta,
        required this.blg,
        this.reviews,
        required this.pendingRequests,
        required this.totalRequests,
        required this.lat,
        required this.long,
        required this.locationFollow,
        required this.availableTime,
        required this.bandwidth,
    });

    int uid;
    String name;
    String countryCode;
    int phoneNo;
    String profilePic;
    List<String> coverPic;
    String gender;
    String languageSpeak;
    String address;
    String quote;
    int followers;
    int followings;
    String profession;
    String dob;
    bool btp;
    bool bta;
    bool blg;
    dynamic reviews;
    int pendingRequests;
    int totalRequests;
    double lat;
    double long;
    List<String> locationFollow;
    List<String> availableTime;
    String bandwidth;

    factory list_user_model.fromJson(Map<String, dynamic> json) => list_user_model(
        uid: json["uid"],
        name: json["name"],
        countryCode: json["countryCode"],
        phoneNo: json["phoneNo"],
        profilePic: json["profilePic"],
        coverPic: List<String>.from(json["coverPic"].map((x) => x)),
        gender: json["gender"],
        languageSpeak: json["languageSpeak"],
        address: json["address"],
        quote: json["quote"],
        followers: json["followers"],
        followings: json["followings"],
        profession: json["profession"],
        dob: json["dob"],
        btp: json["btp"],
        bta: json["bta"],
        blg: json["blg"],
        reviews: json["reviews"],
        pendingRequests: json["pendingRequests"],
        totalRequests: json["totalRequests"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        locationFollow: List<String>.from(json["locationFollow"].map((x) => x)),
        availableTime: List<String>.from(json["availableTime"].map((x) => x)),
        bandwidth: json["bandwidth"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "countryCode": countryCode,
        "phoneNo": phoneNo,
        "profilePic": profilePic,
        "coverPic": List<dynamic>.from(coverPic.map((x) => x)),
        "gender": gender,
        "languageSpeak": languageSpeak,
        "address": address,
        "quote": quote,
        "followers": followers,
        "followings": followings,
        "profession": profession,
        "dob": dob,
        "btp": btp,
        "bta": bta,
        "blg": blg,
        "reviews": reviews,
        "pendingRequests": pendingRequests,
        "totalRequests": totalRequests,
        "lat": lat,
        "long": long,
        "locationFollow": List<dynamic>.from(locationFollow.map((x) => x)),
        "availableTime": List<dynamic>.from(availableTime.map((x) => x)),
        "bandwidth": bandwidth,
    };
}











// // To parse this JSON data, do
// //
// //     final list_user_model = list_user_modelFromJson(jsonString);

// import 'dart:convert';

// List<list_user_model> list_user_modelFromJson(String str) => List<list_user_model>.from(json.decode(str).map((x) => list_user_model.fromJson(x)));

// String list_user_modelToJson(List<list_user_model> data) => json.encode(List<list_user_model>.from(data.map((x) => x.toJson())));

// class list_user_model {
//   int? uid;
//   String? name;
//   String? countryCode;
//   int? phoneNo;
//   String? profilePic;
//   List<String>? coverPic;
//   String? gender;
//   String? languageSpeak;
//   String? address;
//   String? quote;
//   int? followers;
//   int? followings;
//   String? profession;
//   String? dob;
//   bool? btp;
//   bool? bta;
//   bool? blg;
//   Null? reviews;
//   int? pendingRequests;
//   int? totalRequests;
//   double? lat;
//   double? long;
//   List<String>? locationFollow;
//   List<String>? availableTime;
//   String? bandwidth;

//   list_user_model(
//       {this.uid,
//       this.name,
//       this.countryCode,
//       this.phoneNo,
//       this.profilePic,
//       this.coverPic,
//       this.gender,
//       this.languageSpeak,
//       this.address,
//       this.quote,
//       this.followers,
//       this.followings,
//       this.profession,
//       this.dob,
//       this.btp,
//       this.bta,
//       this.blg,
//       this.reviews,
//       this.pendingRequests,
//       this.totalRequests,
//       this.lat,
//       this.long,
//       this.locationFollow,
//       this.availableTime,
//       this.bandwidth});

//   list_user_model.fromJson(Map<String, dynamic> json) {
//     uid = json['uid'];
//     name = json['name'];
//     countryCode = json['countryCode'];
//     phoneNo = json['phoneNo'];
//     profilePic = json['profilePic'];
//     coverPic = json['coverPic'].cast<String>();
//     gender = json['gender'];
//     languageSpeak = json['languageSpeak'];
//     address = json['address'];
//     quote = json['quote'];
//     followers = json['followers'];
//     followings = json['followings'];
//     profession = json['profession'];
//     dob = json['dob'];
//     btp = json['btp'];
//     bta = json['bta'];
//     blg = json['blg'];
//     reviews = json['reviews'];
//     pendingRequests = json['pendingRequests'];
//     totalRequests = json['totalRequests'];
//     lat = json['lat'];
//     long = json['long'];
//     locationFollow = json['locationFollow'].cast<String>();
//     availableTime = json['availableTime'].cast<String>();
//     bandwidth = json['bandwidth'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uid'] = this.uid;
//     data['name'] = this.name;
//     data['countryCode'] = this.countryCode;
//     data['phoneNo'] = this.phoneNo;
//     data['profilePic'] = this.profilePic;
//     data['coverPic'] = this.coverPic;
//     data['gender'] = this.gender;
//     data['languageSpeak'] = this.languageSpeak;
//     data['address'] = this.address;
//     data['quote'] = this.quote;
//     data['followers'] = this.followers;
//     data['followings'] = this.followings;
//     data['profession'] = this.profession;
//     data['dob'] = this.dob;
//     data['btp'] = this.btp;
//     data['bta'] = this.bta;
//     data['blg'] = this.blg;
//     data['reviews'] = this.reviews;
//     data['pendingRequests'] = this.pendingRequests;
//     data['totalRequests'] = this.totalRequests;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['locationFollow'] = this.locationFollow;
//     data['availableTime'] = this.availableTime;
//     data['bandwidth'] = this.bandwidth;
//     return data;
//   }
// }
