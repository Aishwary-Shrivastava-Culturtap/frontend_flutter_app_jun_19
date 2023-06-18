// import 'package:tryapp/screens/add_video_camera/s_5_add_video_form/validationModel.dart';
// import 'package:flutter/material.dart';

import 'dart:io';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class add_video_provider with ChangeNotifier {
  int userID = login_form_provider().userId;
  String address = "";
  int lat = 0;
  int long = 0;
  String Category = "";
  String Genre = "";
  String title = "";
  String Describe_experience = "";
  String like_aboute_place = "";
  String Review_place = "";
  int rate_experience = 0;
  // bool shared = false;
  bool draft = false;
  String available_shared = "";
  // String location = "";
  int VideoId = 0;
  List<File> allFileList = [];

  setvideo(List<File> list) {
    allFileList = list;
    notifyListeners();
  }

  get get_like_about_place => like_aboute_place;

  setValue({
    String Category = "",
    String Genre = "",
    String Describe_experience = "",
    String like_aboute_place = "",
    String Review_place = "",
    int rate_experience = 0,
    String available = "",
    String location = "",
  }) {
    this.Category = Category;
    this.Genre = Genre;
    this.Describe_experience = Describe_experience;
    this.like_aboute_place = like_aboute_place;
    this.Review_place = Review_place;
    this.rate_experience = rate_experience;
    this.available_shared = available;
    this.address = location;
    notifyListeners();
    print("saved succefully");
  }

  Future<void> upload_Video() async {
    final url = Uri.parse(api.BASE_URL + api.ADD_VIDEO_DETAIL);
    print("inside upload video");

    try {
      final response = await http.post(url,
          body: json.encode({
            "uid": userID,
            "url": [],
            "address": address,
            "lat": 0,
            "long": 0,
            "category": Category,
            "genre": Genre,
            "title": title,
            "description": Describe_experience,
            "pros": like_aboute_place,
            "cons": Review_place,
            "shared": false,
            "draft": false,
            "views": 0,
            "likes": 0
          }),
          headers: {"content-type": "application/json"});

      if (response.statusCode == 201) {
        final responseData = addVideoResponseFromJson(response.body);
        VideoId = responseData.videoId;

        print("${VideoId} ----  ${responseData.uid}");
      }

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<bool?> save_video() async {
    int byteCount = 0;
    List<http.MultipartFile> newList = [];
    var serverReceiverPath =
        "${api.BASE_URL}${api.SAVE_VIDEO}videoId=$VideoId&action=add";
    List paths = allFileList!.map((e) => e.path).toList();
    print(paths);
    try {
  for (int i = 0; i < paths.length; i++) {
      var multipartFile = await http.MultipartFile.fromPath('video', paths[i]);
      newList.add(multipartFile);
    }

    var request = http.MultipartRequest('POST', Uri.parse(serverReceiverPath));
    request.files.addAll(newList);
    print("addAll success");

    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@${newList.length}");

    // request.contentLength = 1000;

    var res = await request.send();
    final respStr = await res.stream.bytesToString();

    print(
        "${res.headers} /////{ }/////////////\n ${respStr}///////////////");

    return true;


    } catch (e) {
      print(e);
    }
  
  }
  //
}

AddVideoResponse addVideoResponseFromJson(String str) =>
    AddVideoResponse.fromJson(json.decode(str));

String addVideoResponseToJson(AddVideoResponse data) =>
    json.encode(data.toJson());

class AddVideoResponse {
  AddVideoResponse({
    required this.uid,
    required this.videoId,
  });

  int uid;
  int videoId;

  factory AddVideoResponse.fromJson(Map<String, dynamic> json) =>
      AddVideoResponse(
        uid: json["uid"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "videoId": videoId,
      };
}

// To parse this JSON data, do
//
//     final responseSaveVideo = responseSaveVideoFromJson(jsonString);

ResponseSaveVideo responseSaveVideoFromJson(String str) =>
    ResponseSaveVideo.fromJson(json.decode(str));

String responseSaveVideoToJson(ResponseSaveVideo data) =>
    json.encode(data.toJson());

class ResponseSaveVideo {
  ResponseSaveVideo({
    required this.url,
    required this.videoKeys,
  });

  List<String> url;
  List<String> videoKeys;

  factory ResponseSaveVideo.fromJson(Map<String, dynamic> json) =>
      ResponseSaveVideo(
        url: List<String>.from(json["url"].map((x) => x)),
        videoKeys: List<String>.from(json["videoKeys"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "url": List<dynamic>.from(url.map((x) => x)),
        "videoKeys": List<dynamic>.from(videoKeys.map((x) => x)),
      };
}

// class Api {
//   static const String baseUrl = 'http://172.21.17.179:8000';
//   static const String endpoint = '/videos/get/video/';

//   static Future<List<dynamic>> getVideoData(String videoId) async {
//     final response = await http.get(Uri.parse('$baseUrl$endpoint$videoId'));

//     if (response.statusCode == 200) {
//       // final Map<String, dynamic> data = json.decode(response.body);

//       final itemList = welcomeFromJson(response.body);
//       // print(data);
//       // final List<dynamic> videoUrl = data['url'];
//       print("=======================${videoUrl.first}");

//       // final List<Uint8List> videoData2 = [];

//       // for (var element in videoUrl) {
//       //   print("in loop ${element}");
//       //   videoData2.add(await http.readBytes(Uri.parse(element)));
//       // }

//       // final Uint8List videoData = await http.readBytes(Uri.parse(videoUrl));
//       print("end");
//       return videoUrl;
//     } else {
//       throw Exception('Failed to load video data');
//     }
//   }
// }
// class FormProvider extends ChangeNotifier {
//   // ValidationModel _email = ValidationModel(null, null);
//   // ValidationModel _password = ValidationModel(null, null);
//   // ValidationModel _phone = ValidationModel(null, null);
//   ValidationModel _name = ValidationModel(null, null);
//   // ValidationModel get email => _email;
//   // ValidationModel get password => _password;
//   // ValidationModel get phone => _phone;
//   ValidationModel get name => _name;

//   // void validateEmail(String? val) {
//   //   if (val != null && val.isValidEmail) {
//   //     _email = ValidationModel(val, null);
//   //   } else {
//   //     _email = ValidationModel(null, 'Please Enter a Valid Email');
//   //   }
//   //   notifyListeners();
//   // }

//   // void validatePassword(String? val) {
//   //   if (val != null && val.isValidPassword) {
//   //     _password = ValidationModel(val, null);
//   //   } else {
//   //     _password = ValidationModel(null,
//   //         'Password must contain an uppercase, lowercase, numeric digit and special character');
//   //   }
//   //   notifyListeners();
//   // }

//   void validateName(String? val) {
//     if (val != null && val.isValidName) {
//       _name = ValidationModel(val, null);
//     } else {
//       _name = ValidationModel(null, 'Please enter a valid name');
//     }
//     notifyListeners();
//   }

//   // void validatePhone(String? val) {
//   //   if (val != null && val.isValidPhone) {
//   //     _phone = ValidationModel(val, null);
//   //   } else {
//   //     _phone = ValidationModel(null, 'Phone Number must be up to 11 digits');
//   //   }
//   //   notifyListeners();
//   // }

//   bool get validate {
//     return
//     // _email.value != null &&
//     //     _password.value != null &&
//     //     _phone.value != null &&
//         _name.value != null;
//   }
// }

// extension extString on String {
//   bool get isValidEmail {
//     // final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     return true;
//   }

//   bool get isValidName {
//     final nameRegExp = RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$");
//     // final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//     // return nameRegExp.hasMatch(this);
//     return true;
//   }

//   bool get isValidPassword {
//     final passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");

//     // final passwordRegExp = RegExp(
//     //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
//     // return passwordRegExp.hasMatch(this);
//     return true;

//   }

//   bool get isNotNull {
//     return this != null;
//   }

//   bool get isValidPhone {
//     final phoneRegExp =
//         RegExp(r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$");
//     // final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
//     // return phoneRegExp.hasMatch(this);
//     return true;

//   }
// }
