import 'package:culturtap/constants/constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class schedule_call_provider with ChangeNotifier {
  int requestFrom = 0;
  int requestTo = 0;
  String title = "going to goa";
  String from = "2023-02-03 06:20:00am";
  String to = "2023-02-03 06:40:00am";

  String onlytimefrom = "06:20:00am";
  String onlytimeto = "06:40:00am";
  String? finalpickedDate = "2023-02-03";
  bool _available = false;
  String _insertedId = "";
  String _status = "";

  get available => _available;
  get status => _status;

  setvalue({requestFromT, requestToT, titleT, fromT, toT}) {
    requestFrom = requestFromT;
    requestTo = requestToT;
    title = titleT;
    from = fromT;
    to = toT;

    notifyListeners();
  }

  Future<void> add_call() async {
    print("inside schedule call");
    // final url = Uri.parse("http://0.0.0.0:8000/call/add");
    final url = Uri.parse(api.BASE_URL + api.CALL_ADD);

    try {
      print("schedule call TRY");

      final response = await http.post(
        url,
        headers: {"content-type": "application/json"},
        body: json.encode(<String, dynamic>{
          "requestFrom": requestFrom,
          "requestTo": requestTo,
          "title": title,
          "from_": from,
          "to": to
        }),
      );

      {
        // "msg": "not possible"
      }

      final responseData = json.decode(response.body);
      // print(" you otp is  ${responseData["code"].runtimeType}");

      if (response.body.contains("msg")) {
        print(responseData["msg"]);
        _available = false;
        // notifyListeners();

        return;
      } else if (response.body.contains("insertedId")) {
        print("successfully added");
        print("-----------> ${responseData["insertedId"]}");
        print("-----------> ${responseData["status"]}");

        _insertedId = responseData["insertedId"];
        _insertedId = responseData["insertedId"];

        _status = responseData["status"];
        notifyListeners();

        // "status": "call added"
        _available = true;
        print("${response.body}");

        return;
      } else if (response.body.contains("detail")) {
        print("Bad Request");
        _available = false;

        // print("${responseData}");
        notifyListeners();

        return;
      } else {
        print("error");
        _available = false;
      }

      notifyListeners();
    } catch (error) {
      print("-------- $error");
      _available = false;
      notifyListeners();

      // throw error;
    }
    // notifyListeners();
  }
}


// class schedule_call_add_res_model {
//   final int id;
//   final String title;

//   const schedule_call_add_res_model({required this.id, required this.title});

//   factory schedule_call_add_res_model.fromJson(Map<String, dynamic> json) {
//     return schedule_call_add_res_model(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }