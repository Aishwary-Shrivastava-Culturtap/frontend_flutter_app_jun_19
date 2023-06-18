import 'dart:developer';

import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/search_user_model.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class list_user_provider with ChangeNotifier {
  List<list_user_model> _items = [];

  List<list_user_model> get users {
    return [..._items];
  }

  list_user_model findById(int id) {
    return _items.firstWhere((prod) => prod.uid == id);
  }

  getUsers() async {
    try {
      var url = Uri.parse(api.BASE_URL + api.USER_GET);
      var response = await http.get(url);

      print("########################################################################${response.body}");
      if (response.statusCode == 200) {
        _items.addAll(list_user_modelFromJson(response.body));
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
