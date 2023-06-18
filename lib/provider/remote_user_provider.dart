import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/search_user_model.dart';
import 'package:culturtap/provider/list_user_provider.dart';
import 'package:flutter/material.dart';

class remote_user_provider with ChangeNotifier {
  late list_user_model _user;
  bool _isloaded = false;

  setuser(list_user_model user) {
    _user = user;
    notifyListeners();
  }

  get getuser => _user  ;
  // get isloaded => _isloaded;

  // remote_user_provider({
  //   required this.name,
  //   required this.uid,
  //   required this.countryCode,
  //   required this.phoneNo,
  //   required this.profilePic,
  //   required this.coverPic,
  //   required this.gender,
  //   required this.languageSpeak,
  //   required this.address,
  //   required this.quote,
  //   required this.followers,
  //   required this.followings,
  //   required this.profession,
  //   required this.dob,
  //   required this.btp,
  //   required this.bta,
  //   required this.blg,
  //   required this.reviews,
  //   required this.pendingRequests,
  //   required this.totalRequests,
  //   required this.lat,
  //   required this.long,
  //   required this.locationFollow,
  //   required this.availableTime,
  //   required this.bandwidth,
  // });
  // int uid;
  // String name;
  // String countryCode;
  // int phoneNo;
  // String profilePic;
  // String coverPic;
  // String gender;
  // String languageSpeak;
  // String address;
  // String quote;
  // int followers;
  // int followings;
  // String profession;
  // String dob;
  // bool btp;
  // bool bta;
  // bool blg;
  // List<List<int>> reviews;
  // int pendingRequests;
  // int totalRequests;
  // int lat;
  // int long;
  // List<String> locationFollow;
  // List<String> availableTime;
  // String bandwidth;
  // int _uid = 0;
  // String _name = "shubham";
  // String _countryCode = "+91";
  // int _phoneNo = 9503444265;
  // String _profilePic = asset.AVATAR;
  // String _coverPic = "";
  // String _gender = "male";
  // String _languageSpeak = "english";
  // String _address = "sector 29, delhi";
  // String _quote = "god is one";
  // int _followers = 2;
  // int _followings = 32;
  // String _profession = "life guard";
  // String _dob = "04/10/2004";
  // bool _btp = false;
  // bool _bta= false;
  // bool _blg= false;
  // List<List<int>> _reviews   = [];
  // int _pendingRequests = 0;
  // int _totalRequests = 0;
  // int _lat = 0;
  // int _long = 0;
  // List<String> _locationFollow =[];
  // List<String> _availableTime = ["06:00:00", "21:00:00"];
  // String _bandwidth ="daily";

  // set setuid(n) {
  //   _uid = n;
  //   notifyListeners();
  // }

  // set setname(n) {
  //   _name = n;
  //   notifyListeners();
  // }

  // set setcountryCode(n) {
  //   _countryCode = n;
  //   notifyListeners();
  // }

  // set setphoneNo(n) {
  //   _phoneNo = n;
  //   notifyListeners();
  // }

  // set setprofilePic(n) {
  //   _profilePic = n;
  //   notifyListeners();
  // }

  // set setcoverPic(n) {
  //   _coverPic = n;
  //   notifyListeners();
  // }

  // set setgender(n) {
  //   _gender = n;
  //   notifyListeners();
  // }

  // set setlanguageSpeak(n) {
  //   _languageSpeak = n;
  //   notifyListeners();
  // }

  // set setaddress(n) {
  //   _address = n;
  //   notifyListeners();
  // }

  // set setquote(n) {
  //   _quote = n;
  //   notifyListeners();
  // }

  // set setfollowers(n) {
  //   _followers = n;
  //   notifyListeners();
  // }

  // set setfollowings(n) {
  //   _followings = n;
  //   notifyListeners();
  // }

  // set setprofession(n) {
  //   _profession = n;
  //   notifyListeners();
  // }

  // set setdob(n) {
  //   _dob = n;
  //   notifyListeners();
  // }

  // set setbtp(n) {
  //   _btp = n;
  //   notifyListeners();
  // }

  // set setbta(n) {
  //   _bta = n;
  //   notifyListeners();
  // }

  // set setblg(n) {
  //   _blg = n;
  //   notifyListeners();
  // }

  // set setreviews(n) {
  //   _reviews = n;
  //   notifyListeners();
  // }

  // set setpendingRequests(n) {
  //   _pendingRequests = n;
  //   notifyListeners();
  // }

  // set settotalRequests(n) {
  //   _totalRequests = n;
  //   notifyListeners();
  // }

  // set setlat(n) {
  //   _lat = n;
  //   notifyListeners();
  // }

  // set setlong(n) {
  //   _long = n;
  //   notifyListeners();
  // }

  // set setlocationFollow(n) {
  //   _locationFollow = n;
  //   notifyListeners();
  // }

  // set setavailableTime(n) {
  //   _availableTime = n;
  //   notifyListeners();
  // }

  // set setbandwidth(n) {
  //   _bandwidth = n;
  //   notifyListeners();
  // }

  // get getname => name;
  // get getuid => uid;
  // get getcountryCode => countryCode;
  // get getphoneNo => phoneNo;
  // get getprofilePic => profilePic;
  // get getcoverPic => coverPic;
  // get getgender => gender;
  // get getlanguageSpeak => languageSpeak;
  // get getaddress => address;
  // get getquote => quote;
  // get getfollowers => followers;
  // get getfollowings => followings;
  // get getprofession => profession;
  // get getdob => dob;
  // get getbtp => btp;
  // get getbta => bta;
  // get getblg => blg;
  // get getreviews => reviews;
  // get getpendingRequests => pendingRequests;
  // get gettotalRequests => totalRequests;
  // get getlat => lat;
  // get getlong => long;
  // get getlocationFollow => locationFollow;
  // get getavailableTime => availableTime;
  // get getbandwidth => bandwidth;

  // update_remote_user({

  //   uid,
  //   countryCode = "+91",
  //   phoneNo = 9503444265,
  //   profilePic = asset.AVATAR,
  //   coverPic= "",
  //   gender= "male",
  //   languageSpeak= "english",
  //   address= "sector 29, delhi",
  //   quote= "god is one",
  //   followers= 2,
  //   followings = 21,
  //   profession = "l",
  //   dob= "04/10/2004",
  //   btp = false,
  //   bta = false,
  //   blg = false,
  //   reviews = const[],
  //   pendingRequests = 0 ,
  //   totalRequests = 0 ,
  //   lat = 0,
  //   long,
  //   locationFollow,
  //   availableTime,
  //   bandwidth,
  // }){

  // }
}




//{
    // "callId": "63cffcb7beabcb55063b6074",
    // "requestFrom": 0,
    // "requestTo": 1,
    // "title": "string",
    // "from_": "24-01-2023 18:07:00",
    // "to": "24-01-2023 18:27:00",
    // "status": "scheduled"
  // },