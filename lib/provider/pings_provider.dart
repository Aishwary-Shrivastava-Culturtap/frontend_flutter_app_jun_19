import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/pinds_model.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class pings_provider with ChangeNotifier {
  List<pings_model> _model = [];

  List<pings_model> get getListPings => [..._model];

  int user_id = login_form_provider().userId;

  Future<void> getUsers() async {
    _model = [
      ...await get("requestFrom", user_id),
      ...await get("requestTo", user_id)
    ];

    notifyListeners();
  }

  Future<List<pings_model>> get(String body_param, int user_id) async {
    List<pings_model> temp = [];
    try {
      var url = Uri.parse(api.BASE_URL + api.CALL_GET);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"$body_param": user_id}),
      );

      if (response.statusCode == 200) {
        temp = pings_modelFromJson(response.body);
        print(response.body);
        return temp;
      }
    } catch (e) {
      print(e.toString());
    }
    // notifyListeners();
    return [];
  }

  // -----------------------------   cancle_request   -------------------------

  Future<bool> cancle_request(String call_id) async {
    try {
      var url = Uri.parse(api.BASE_URL + api.CALL_DELETE + call_id);
      var response = await http.delete(
        url,
        headers: {"Content-Type": "application/json"},
        // body: json.encode({

        // }),
      );
      if (response.statusCode == 200) {
        // _model = pings_modelFromJson(response.body);
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return true;
  }

  // ----------------------------   unlock_request  --------------------------

  // Future<void> unlock_request(int call_id) async {
  //   try {
  //     var url = Uri.parse(api.BASE_URL + api.CALL_GET);
  //     var response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({}),
  //     );
  //     if (response.statusCode == 200) {
  //       _model = pings_modelFromJson(response.body);
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   notifyListeners();
  // }

  // ----------------------------   unlock_request  --------------------------

  Future<bool> accept_request(String call_id) async {
    try {
      var url = Uri.parse(api.BASE_URL + api.USER_UPDATE + call_id);
      var response = await http.patch(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"status": "accepted"}),
      );
      if (response.statusCode == 200) {
        // _model = pings_modelFromJson(response.body);

        print(response.body);
    return true;

      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
    return false;
  }
}
