import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/http_exception.dart';
import 'package:location/location.dart';

 Location location = new Location();

 
class login_form_provider with ChangeNotifier {
  int _userId =1;
  late String name;
  int phoneNO = 9503444265;
  late String countryCode = "+91";
  late int _otp;
// ----------------------- location ------------------
 
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;
late LocationData _locationData;
  double? latitude;
  double? longitude;

  get getotpcode => _otp;

  int get userId {
    return _userId;
  }

  void setName(n) {
    name = n;
    notifyListeners();
  }

  void setLongitude(n) {
    longitude = n;
    notifyListeners();
  }

  void setLatitude(n) {
    latitude = n;
    notifyListeners();
  }

  void setPhoneNo(n) {
    print("set name fun $n");

    phoneNO = n;
    notifyListeners();
  }

  void setCountryCode(n) {
    countryCode = n;
    notifyListeners();
  }

  void printdetail() {
    print("  $name , $countryCode , $phoneNO");
  }

  void signup() async {
    _authenticate(name, countryCode,  (phoneNO), "user/add");
  }

  Future<void> _authenticate(
      String name, String countryCode, int phoneNo, String urlSegment) async {
    final url = Uri.parse('http://192.168.5.215:8000/$urlSegment');

    try {
      final response = await http.post(url,
          body: json.encode(
            {
              'name': name,
              'countryCode': countryCode,
              "phoneNo": phoneNo,
            },
          ),
          headers: {"content-type": "application/json"});

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['detail'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      // _userId = responseData['uid'];

      // _userId = responseData['localId'];

      notifyListeners();
      //   final prefs = await SharedPreferences.getInstance();
      //   final userData = json.encode(
      //     {
      //       'userId': _userId,
      //     },
      //   );
      //   prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> getotp() async {
    print("inside getotp");
    final url =
    Uri.parse('http://192.168.5.215:8000/sms/otp/$countryCode$phoneNO');
    
        // Uri.parse('http://192.168.5.215:8000/sms/otp/$countryCode$phoneNO');
    try {
      print("inside getotp");

      final response = await http.get(url);

      final responseData = json.decode(response.body);
      // print(" you otp is  ${responseData["code"].runtimeType}");
      print("${responseData["code"]}");

      _otp = responseData["code"];

      notifyListeners();
    } catch (error) {
      print("-------- $error");
      // throw error;
    }
  }
// ===========================================================


    Future<void> getlocationn() async {
       


      print("inside get location");
      try {
        Location location = new Location();
        print("insude try");
        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          print("ser enebled");

          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          print(" status $_permissionGranted");
          _permissionGranted = await location.requestPermission();
          print("persmission gnted");
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }
        _locationData = await location.getLocation();


         setLatitude(_locationData.latitude);
         setLongitude(_locationData.longitude);
         notifyListeners();
 
      } catch (error) {
        print(error);
        // throw error;
      }

      //  void printlocation() async {
      //   _locationData = await location.getLocation();

      //   print("${_locationData.latitude} ${_locationData.longitude}");
      // }
    }

//9503444265
//%2b
  // Future<void> signup(String email, String password) async {
  //   return _authenticate(email, password, 'user/add');
  // }

  // Future<void> login(String email, String password) async {
  //   return _authenticate(email, password, 'verifyPassword');
  // }

  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('userData')) {
  //     return false;
  //   }

  //   final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
  //   final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

  //   if (expiryDate.isBefore(DateTime.now())) {
  //     return false;
  //   }
  //   _token = extractedUserData['token'];
  //   _userId = extractedUserData['userId'];
  //   _expiryDate = expiryDate;
  //   notifyListeners();
  //   _autoLogout();
  //   return true;
  // }

  // Future<void> logout() async {
  //   _token = null;
  //   _userId = null;
  //   _expiryDate = null;
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //     _authTimer = null;
  //   }
  //   notifyListeners();
  //   final prefs = await SharedPreferences.getInstance();
  //   // prefs.remove('userData');
  //   prefs.clear();
  // }

  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  // }
}
